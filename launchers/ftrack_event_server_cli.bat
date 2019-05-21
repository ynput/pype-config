@echo off
:: set basic environments
title Pype tray

pushd %~dp0..\..\..
set PYPE_SETUP_ROOT=%cd%
: debugging
set PYPE_DEBUG=0
set PYPE_DEBUG_STDOUT=0

:: maintain python environment
:: will synchronize remote with local
set SYNC_ENV=0
:: will switch to remote
set REMOTE_ENV_ON=0

start powershell -noexit -nologo -executionpolicy bypass -File pype.ps1 --eventservercli %*
