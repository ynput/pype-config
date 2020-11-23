set __app__="TVPaint Animation 11"

set __32bit__="C:\Program Files (x86)\TVPaint Developpement\TVPaint Animation 11 (32bits)\TVPaint Animation 11 (32bits).exe"
set __64bit__="C:\Program Files\TVPaint Developpement\TVPaint Animation 11 (64bits)\TVPaint Animation 11 (64bits).exe"

set __exe__=%__64bit__%

if not exist %__exe__% goto :missing_app

set "PYPE_SETUP_PATH=%PYPE_SETUP_PATH:\=/%"
start %__app__% cmd.exe /k %PYPE_PYTHON_EXE% "%PYPE_SETUP_PATH%/repos/avalon-core/avalon/tvpaint/launch_script.py" %__exe__% "%PYPE_TVPAINT_PROJECT_FILE%"


goto :eof

:missing_app
    echo ERROR: %__app__% not found in %__exe__%
    exit /B 1
