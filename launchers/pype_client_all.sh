#!/bin/bash
#
# Ftrack Action server
# Linux launcher
#

# find terminal emulator we are running in
TERM_EMU=""
container() {
        pid=$$
        while true; do
                pid=$(ps -h -o ppid -p $pid 2>/dev/null)
                case $(ps -h -o comm -p $pid 2>/dev/null) in
                (gnome-terminal) TERM_EMU="gnome-terminal";return;;
                (xterm) TERM_EMU="xterm";return;;
                (rxvt) TERM_EMU="rxvt";return;;
                (xfce4-terminal) TERM_EMU="xfce4-terminal";return;;
                (python) if [ ! -z "$(ps -h -o args -p $pid 2>/dev/null | grep guake)"]; then TERM_EMU="Guake"; return; fi ;;
                esac
                [[ $(echo $pid) == 1 ]] && break
        done
}
container


# Full path of the current script
THIS=`readlink -f "${BASH_SOURCE[0]}" 2>/dev/null||echo $0`
# The directory where current script resides
DIR=`dirname "${THIS}"`

export PYPE_STUDIO_TEMPLATES="$(cd $DIR/../ ; pwd)"
export PYPE_SETUP_ROOT="$(cd $DIR/../../../ ; pwd)"
CONDA_SHARED="/tmp"

# debugging
export PYPE_DEBUG=1
export PYPE_DEBUG_STDOUT=1

# include terminal color definitions
source "$PYPE_SETUP_ROOT/bin/colors.sh"

echo -e "${IGreen}>>>${RST} ${BIWhite}Welcome to Pipe Club${RST}"
echo -e "${IGreen}>>>${RST} launching Conda ..."

# Launch Conda
source "$PYPE_SETUP_ROOT/bin/launch_conda.sh"

# FTrack access settings
export FTRACK_API_USER=$1
export FTRACK_API_KEY=$2

# Launch FTrack action server
if [ -z "$TERM_EMU" ] ; then
  echo -e "${IGreen}>>>${RST} launching server ..."
  python "$PYPE_SETUP_ROOT/app/pype-start.py --actionserver" &
else
  echo -e "${IGreen}>>>${RST} launching server in terminal emulator ..."
  eval $TERM_EMU -H -x "bash $DIR/ftrack_action_server.sh"
fi
echo -e "${IGreen}>>>${RST} starting Pype ..."
python "$PYPE_SETUP_ROOT/app/pype-start.py" "$@"
