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

REM Validate branch name
if "%BRANCH_NAME%"=="" (
    echo No branch name found in .workingBranch file.
    color %COLOR_FAIL%
    pause
    color %COLOR_RESET%
    exit /b 1
)

echo Pulling latest changes for branch "%BRANCH_NAME%"...
echo.

REM Public Repo
color %COLOR_ENTER%
echo Pulling from Assets/Public...
cd /d "X:/Spirits Rising/Assets/Public"
git pull origin %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error pulling from Assets/Public.
    pause
    color %COLOR_RESET%
    exit /b 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Public...
echo.

REM Private Repo
color %COLOR_ENTER%
echo Pulling from Assets/Private...
cd /d "X:/Spirits Rising/Assets/Private"
git pull origin %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error pulling from Assets/Private.
    pause
    color %COLOR_RESET%
    exit /b 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Private...
echo.

REM Main Repo
color %COLOR_ENTER%
echo Pulling from Main Repo...
cd /d "X:/Spirits Rising"
git pull origin %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error pulling from Main Repo.
    pause
    color %COLOR_RESET%
    exit /b 1
)
color %COLOR_LEAVE%
echo Leaving Main Repo...
echo.

color %COLOR_SUCCESS%
echo Pull complete for all repositories.
echo.
echo 09 > "X:/Spirits Rising/.gitupdate/.iteratorcheck"

color %COLOR_RESET%
exit /B
