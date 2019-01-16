@echo off
title Pype's local mongodb
:: set basic environments

set AVALON_MONGO_PORT=2707
set AVALON_MONGO=mongodb://localhost:%AVALON_MONGO_PORT%
set AVALON_DB=avalon
pushd %~dp0..\..\..
set PYPE_SETUP_ROOT=%cd%
set AVALON_DB_DATA=%PYPE_SETUP_ROOT%\..\mongo_db_data

start powershell -noexit -nologo -executionpolicy bypass -File pype.ps1 --local-mongodb %*
