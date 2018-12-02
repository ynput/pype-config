@echo off
taskkill /FI "WINDOWTITLE eq Pype's*" /F

title Pype's local mongodb
:: set basic environments
pushd %~dp0..
set PYPE_STUDIO_TEMPLATES=%cd%
pushd %~dp0..\..\..
set PYPE_SETUP_ROOT=%cd%


:: maintain python environment
:: will synchronize remote with local
set SYNC_ENV=0
:: will switch to remote
set REMOTE_ENV_ON=0
call %PYPE_SETUP_ROOT%\bin\launch_conda.bat

:: debugging
set PYPE_DEBUG=0
set DEBUG=%PYPE_DEBUG%

set AVALON_MONGO_PORT=27072
set AVALON_MONGO=mongodb://localhost:%AVALON_MONGO_PORT%
set AVALON_DB=avalon
set AVALON_DB_DATA=%PYPE_SETUP_ROOT%\..\mongo_db_data

start "Pype's Avalon mongodb-localserver" pype --local-mongodb %*
