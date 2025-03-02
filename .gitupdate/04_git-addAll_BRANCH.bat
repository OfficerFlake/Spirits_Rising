@echo off
cd /d "X:/Spirits Rising/"

REM Color Definitions (Valid Hexadecimal Codes)
set COLOR_INFO=0F
set COLOR_ENTER=0E
set COLOR_LEAVE=0A
set COLOR_SUCCESS=0B
set COLOR_RESET=07
set COLOR_PROMPT=7D
set COLOR_FAIL=0C



echo Adding files and folders to %BRANCH_NAME%
echo.

REM Public repo
color %COLOR_ENTER%
echo Entering Assets/Public...
cd /d "X:/Spirits Rising/Assets/Public"
git add .
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while adding changes to the Public Repo.
    pause
    exit /B 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Public...
echo.

REM Private repo
color %COLOR_ENTER%
echo Entering Assets/Private...
cd /d "X:/Spirits Rising/Assets/Private"
git add .
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while adding changes to the Private Repo.
    pause
    exit /B 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Private...
echo.

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
cd /d "X:/Spirits Rising"
git add .
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while adding changes to the Main Repo.
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo Leaving Main Repo...
echo.

color %COLOR_SUCCESS%
echo Add complete.
echo.
echo 05 > "X:/Spirits Rising/.gitupdate/.iteratorCheck"
pause
color %COLOR_RESET%
exit /B