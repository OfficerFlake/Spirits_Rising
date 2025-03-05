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
)

echo Deleting branch "%BRANCH_NAME%"...
echo.

REM Public Repo
color %COLOR_ENTER%
echo Deleting branch in Assets/Public...
cd /d "X:/Spirits Rising/Assets/Public"
git branch -d %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error deleting local branch "%BRANCH_NAME%" in Assets/Public.
    pause
    color %COLOR_RESET%
)
git push origin --delete %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error deleting remote branch "%BRANCH_NAME%" in Assets/Public.
    pause
    color %COLOR_RESET%
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Deleted branch in Assets/Public.
echo.

REM Private Repo
color %COLOR_ENTER%
echo Deleting branch in Assets/Private...
cd /d "X:/Spirits Rising/Assets/Private"
git branch -d %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error deleting local branch "%BRANCH_NAME%" in Assets/Private.
    pause
    color %COLOR_RESET%
)
git push origin --delete %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error deleting remote branch "%BRANCH_NAME%" in Assets/Private.
    pause
    color %COLOR_RESET%
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Deleted branch in Assets/Private.
echo.

REM Main Repo
color %COLOR_ENTER%
echo Deleting branch in Main Repo...
cd /d "X:/Spirits Rising"
git branch -d %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error deleting local branch "%BRANCH_NAME%" in Main Repo.
    pause
    color %COLOR_RESET%
)
git push origin --delete %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error deleting remote branch "%BRANCH_NAME%" in Main Repo.
    pause
    color %COLOR_RESET%
)
color %COLOR_LEAVE%
echo Deleted branch in Main Repo.
echo.

color %COLOR_SUCCESS%
echo Branch deletion completed successfully for both local and remote in all repositories.
echo.
echo 11 > "X:/Spirits Rising/.gitupdate/.iteratorcheck"
echo main > "X:/Spirits Rising/.gitupdate/.workingBranch"

color %COLOR_RESET%
exit /B
