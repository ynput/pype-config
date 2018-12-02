@echo off

taskkill /FI "WINDOWTITLE eq Pype's*" /F

title Pype's local mongodb

:: set basic environments
pushd %~dp0..
set PYPE_STUDIO_TEMPLATES=%cd%
pushd %~dp0..\..\..
set PYPE_SETUP_ROOT=%cd%
set PYPE_APP_ROOT=%PYPE_SETUP_ROOT%\app

:: debugging
set PYPE_DEBUG=0
set PYPE_DEBUG_STDOUT=0

:: maintain python environment
:: will synchronize remote with local
set SYNC_ENV=0
:: will switch to remote
set REMOTE_ENV_ON=0

call %PYPE_SETUP_ROOT%\bin\launch_conda.bat
start "Pype's launcher" pype --launcher %*
