@echo off

set __app__="After Effects 2021"
set __exe__="c:\Program Files\Adobe\Adobe After Effects 2021\Support Files\AfterFX.exe"
if not exist %__exe__% goto :missing_app

start %__app__% cmd.exe /k "%PYPE_PYTHON_EXE% -c ^"import avalon.aftereffects;avalon.aftereffects.launch("%__exe__%", ""%PYPE_AE_WORKFILE_PATH%"")^""

goto :eof

pause

:missing_app
    echo ERROR: %__app__% not found in %__exe__%
    exit /B 1
