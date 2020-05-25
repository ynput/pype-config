@echo off

set __app__="Resolve"
set __appy__="Resolve Python Console"
set __exe__="C:/Program Files/Blackmagic Design/DaVinci Resolve/Resolve.exe"
set __py__="%PYTHON36_RES%/python.exe"

if not exist %__exe__% goto :missing_app

start %__app__% %__exe__% %*
start %__appy__% %__py__% -i %PRE_PYTHON_SCRIPT%

goto :eof

:missing_app
    echo ERROR: %__app__% not found in %__exe__%
    exit /B 1
