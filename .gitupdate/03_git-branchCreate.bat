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

REM Ask user for branch name
color %COLOR_PROMPT%
set /p BRANCH_NAME=Enter the name of the new branch: 

color %COLOR_INFO%
echo Creating a new git branch named %BRANCH_NAME%...
echo.
color %COLOR_RESET%

REM Public repo
color %COLOR_ENTER%
echo Entering Assets/Public...
cd "X:/Spirits Rising/Assets/Public"
git checkout -b %BRANCH_NAME%
git checkout %BRANCH_NAME%
cd "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Public...
echo.

REM Private repo
color %COLOR_ENTER%
echo Entering Assets/Private...
cd "X:/Spirits Rising/Assets/Private"
git checkout -b %BRANCH_NAME%
git checkout %BRANCH_NAME%
cd "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Private...
echo.

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
cd "X:/Spirits Rising/"
git checkout -b %BRANCH_NAME%
git checkout %BRANCH_NAME%
color %COLOR_LEAVE%
echo Leaving Main Repo...
echo.

REM Write the branch name to .workingBranch file
echo %BRANCH_NAME% > "X:/Spirits Rising/.gitupdate/.workingBranch"

color %COLOR_SUCCESS%
echo Branch %BRANCH_NAME% created successfully and written to .workingBranch.
echo.
echo 04 > "X:/Spirits Rising/.gitupdate/.iteratorCheck"

color %COLOR_RESET%
exit /B