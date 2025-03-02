@echo off
cd /d "X:/Spirits Rising/"
echo.

REM Color Definitions (Valid Hexadecimal Codes)
set COLOR_INFO=0F
set COLOR_ENTER=0E
set COLOR_LEAVE=0A
set COLOR_SUCCESS=0B
set COLOR_RESET=07
set COLOR_PROMPT=7D
set COLOR_FAIL=0C

color %COLOR_INFO%
echo Fetching all changes from remote repositories...
echo.

REM Public repo
color %COLOR_ENTER%
echo Entering Assets/Public...
cd "X:/Spirits Rising/Assets/Public"
git fetch origin
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while fetching from the Public Repo.
    pause
    cd /d "X:/Spirits Rising"
    color %COLOR_RESET%
    exit /B 1
)
cd "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Public...
echo.

REM Private repo
color %COLOR_ENTER%
echo Entering Assets/Private...
cd "X:/Spirits Rising/Assets/Private"
git fetch origin
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while fetching from the Private Repo.
    pause
    cd "X:/Spirits Rising"
    color %COLOR_RESET%
    exit /B 1
)
cd "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Private...
echo.

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
git fetch origin
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while fetching from the Main Repo.
    pause
    color %COLOR_RESET%
    exit /B 1
)
color %COLOR_LEAVE%
echo Leaving Main Repo...
echo.

color %COLOR_SUCCESS%
echo Fetch complete.
echo 02 > "X:/Spirits Rising/.gitupdate/.iteratorcheck"

color %COLOR_RESET%
exit /B