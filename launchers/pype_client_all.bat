@echo off

:: set basic environments
pushd %~dp0..
set PYPE_STUDIO_TEMPLATES=%cd%
pushd %~dp0..\..\..
set PYPE_SETUP_ROOT=%cd%
set PYPE_APP_ROOT=%PYPE_SETUP_ROOT%\app

:: debugging
set PYPE_DEBUG=0

:: maintain python environment
:: will synchronize remote with local
set SYNC_ENV=0
:: will switch to remote
set REMOTE_ENV_ON=0

call %PYPE_SETUP_ROOT%\bin\launch_conda.bat

set FTRACK_API_USER=%1
set FTRACK_API_KEY=%2

::python %PYPE_SETUP_ROOT%\app\cli.py %*
start pype --actionserver
pype --launcher
