#!/bin/bash
#
# Ftrack Action server
# Linux launcher
#

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
echo -e "${IGreen}>>>${RST} launching server ..."
python "$PYPE_SETUP_ROOT/app/pype-start.py" --actionserver
