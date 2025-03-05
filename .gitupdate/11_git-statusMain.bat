@echo off
cd /d "X:/Spirits Rising/"

REM ===========================================
REM Color Definitions (Valid Hexadecimal Codes)
REM ===========================================
set COLOR_INFO=0F
set COLOR_ENTER=0E
set COLOR_LEAVE=0B
set COLOR_SUCCESS=0A
set COLOR_RESET=07
set COLOR_PROMPT=7D
set COLOR_FAIL=0C

echo Checking Status of Main...
echo.

color %COLOR_ENTER%
echo Entering Main Repo...
cd /d "X:/Spirits Rising"
git status
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while checking submodule status in the Main Repo.
    pause
    color %COLOR_RESET%
    exit /B 1
)
color %COLOR_LEAVE%
echo Leaving Main Repo...
echo.

color %COLOR_SUCCESS%
echo Status check complete.
echo.
echo 12 > "X:/Spirits Rising/.gitupdate/.iteratorCheck"

color %COLOR_RESET%
exit /B