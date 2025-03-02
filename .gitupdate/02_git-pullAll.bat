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

color %COLOR_INFO%
echo Pulling the latest changes for all repositories...
echo.
color %COLOR_RESET%

REM Public repo
color %COLOR_ENTER%
echo Entering Assets/Public...
cd "X:/Spirits Rising/Assets/Public"
git pull origin main
cd "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Public...
color %COLOR_RESET%
echo.

REM Private repo
color %COLOR_ENTER%
echo Entering Assets/Private...
cd "X:/Spirits Rising/Assets/Private"
git pull origin main
cd "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Private...
color %COLOR_RESET%
echo.

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
git pull origin main
color %COLOR_LEAVE%
echo Leaving Main Repo...
color %COLOR_RESET%
echo.


color %COLOR_SUCCESS%
echo Pull complete.
echo.
echo 3 > "X:/Spirits Rising/.gitupdate/.iteratorcheck"

color %COLOR_RESET%
exit /B