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

REM Load the branch name from the .workingBranch file
set /p BRANCH_NAME=<"X:/Spirits Rising/.gitupdate/.workingBranch"

REM Check if branch name is empty
if "%BRANCH_NAME%"=="" (
    color %COLOR_FAIL%
    echo Error: Branch name not found in .workingBranch.
    pause
    color %COLOR_RESET%
    exit /b 1
)

echo Checking out Main for all submodules...
echo.

REM Switch to main branch in Assets/Public
color %COLOR_ENTER%
echo Switching to main branch in Assets/Public...
cd "X:/Spirits Rising/Assets/Public"
git checkout main
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error switching to main branch in Assets/Public.
    pause
    color %COLOR_RESET%
    exit /b 1
)
cd "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Switched to main branch in Assets/Public.
echo.

REM Switch to main branch in Assets/Private
color %COLOR_ENTER%
echo Switching to main branch in Assets/Private...
cd "X:/Spirits Rising/Assets/Private"
git checkout main
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error switching to main branch in Assets/Private.
    pause
    color %COLOR_RESET%
    exit /b 1
)
cd "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Switched to main branch in Assets/Private.
echo.

REM Switch to main branch in Main Repo
color %COLOR_ENTER%
echo Switching to main branch in Main Repo...
git checkout main
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error switching to main branch in Main Repo.
    pause
    color %COLOR_RESET%
    exit /b 1
)
color %COLOR_LEAVE%
echo Switched to main branch in Main Repo.
echo.

REM Confirmation and iterator check
color %COLOR_SUCCESS%
echo All repositories switched back to main branch.
echo.
echo 09 > "X:/Spirits Rising/.gitupdate/.iteratorcheck"

color %COLOR_RESET%
exit /B
