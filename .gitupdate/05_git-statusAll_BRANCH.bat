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

REM Load the branch name from the .workingBranch file
set /p BRANCH_NAME=<"X:/Spirits Rising/.gitupdate/.workingBranch"

echo Getting status for branch: %BRANCH_NAME%
echo.

color %COLOR_ENTER% 
echo Entering Assets/Public...
cd /d "X:/Spirits Rising/Assets/Public"
git status
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while checking status in the Public Repo.
    pause
    color %COLOR_RESET%
    exit /B 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Public...
echo.

color %COLOR_ENTER%
echo Entering Assets/Private...
cd /d "X:/Spirits Rising/Assets/Private"
git status
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while checking status in the Private Repo.
    pause
    color %COLOR_RESET%
    exit /B 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Private...
echo.

color %COLOR_ENTER%
echo Entering Main Repo...
cd /d "X:/Spirits Rising"
git status
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error occurred while checking status in the Main Repo.
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
echo 06 > "X:/Spirits Rising/.gitupdate/.iteratorCheck"

color %COLOR_RESET%
exit /B