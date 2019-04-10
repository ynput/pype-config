@echo off

:: get actual position path
set _cd_path=%cd%
set PATH=%PATH%;C:\Windows\System32

:: define name of repository dir
set qt5_folder_name=python-qt5

:: set basic vars
set REMOTE_QT5=%PYPE_SETUP_ROOT%\qt5
echo %REMOTE_QT5%
set LOCAL_QT5=%LOCAL_ENV_DIR%\qt5
echo %LOCAL_QT5%

:: go to remote qt5 folder
mkdir %REMOTE_QT5%
cd %REMOTE_QT5%

echo %REMOTE_QT5%\%qt5_folder_name%
:: clone the directory if it is not there
if exist %REMOTE_QT5%\%qt5_folder_name% GOTO CLONE_ESCAPE
mkdir %LOCAL_QT5%\%qt5_folder_name%
git clone https://github.com/pyqt/python-qt5.git
:CLONE_ESCAPE

echo %LOCAL_QT5%\%qt5_folder_name%
if exist %LOCAL_QT5%\%qt5_folder_name% GOTO COPY_ESCAPE
mkdir %LOCAL_QT5%\%qt5_folder_name%
xcopy /e /v %REMOTE_QT5%\%qt5_folder_name% %LOCAL_QT5%\%qt5_folder_name%
echo "coppying files..."
:COPY_ESCAPE

cd %LOCAL_ENV_DIR%\qt5\%qt5_folder_name%
%LOCAL_ENV_DIR%\python2\python.exe -c "import util;util.createqtconf()"
echo "creating qtconf file..."

cd %_cd_path%

exit
