@echo off

:: set basic environments
pushd %~dp0..
set PYPE_STUDIO_TEMPLATES=%cd%
pushd %~dp0..\..\..
set PYPE_SETUP_ROOT=%cd%

:: debugging
set PYPE_DEBUG=1
set PYPE_DEBUG_STDOUT=1

:: maintain python environment
:: will synchronize remote with local
set SYNC_ENV=0
:: will switch to remote
set REMOTE_ENV_ON=0
call %PYPE_SETUP_ROOT%\bin\launch_conda.bat

::python %PYPE_SETUP_ROOT%\app\cli.py %*
python %PYPE_SETUP_ROOT%\app\pype-start.py --traydebug