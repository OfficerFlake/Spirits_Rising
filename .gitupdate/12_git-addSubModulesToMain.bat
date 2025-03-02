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

echo Adding Sub Modules to Main...
echo.

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
cd /d "X:/Spirits Rising"
git add Assets/Public Assets/Private
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while adding submodules to the Main Repo.
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo Leaving Main Repo...
echo.

color %COLOR_SUCCESS%
echo Add Sub Modules complete.
echo.
echo 13 > "X:/Spirits Rising/.gitupdate/.iteratorCheck"

color %COLOR_RESET%
exit /B