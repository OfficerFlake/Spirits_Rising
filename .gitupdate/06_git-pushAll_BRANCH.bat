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

REM Check if the .workingBranch file exists and the branch name is not empty
if "%BRANCH_NAME%"=="" (
    echo No branch name found in .workingBranch file.
    color %COLOR_FAIL%
    pause
    color %COLOR_RESET%
    exit /b 1
)

REM Ask user for commit message
color %COLOR_PROMPT%
set /p COMMIT_MESSAGE=Enter commit message (can be empty): 
color %COLOR_RESET%

REM Check if user input is empty and allow empty commits
if "%COMMIT_MESSAGE%"=="" (
    echo Commit message is empty. Will instead be the name of the branch, %BRANCH_NAME%
    set COMMIT_MESSAGE=%BRANCH_NAME%
)

echo Committing branch: %BRANCH_NAME% with message %COMMIT_MESSAGE%
echo.

REM Public repo
color %COLOR_ENTER%
echo Entering Assets/Public...
cd /d "X:/Spirits Rising/Assets/Public"
git commit -m "%COMMIT_MESSAGE%" --allow-empty
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error committing changes in Assets/Public.
    pause
    color %COLOR_RESET%
    exit /b
)
color %COLOR_LEAVE%
cd /d "X:/Spirits Rising"
echo Leaving Assets/Public...
color %COLOR_RESET%
echo.

REM Private repo
color %COLOR_ENTER%
echo Entering Assets/Private...
cd /d "X:/Spirits Rising/Assets/Private"
git commit -m "%COMMIT_MESSAGE%" --allow-empty
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error committing changes in Assets/Private.
    pause
    color %COLOR_RESET%
    exit /b 1
)
color %COLOR_LEAVE%
cd /d "X:/Spirits Rising"
echo Leaving Assets/Private...
color %COLOR_RESET%
echo.

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
cd /d "X:/Spirits Rising"
git commit -m "%COMMIT_MESSAGE%" --allow-empty
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error committing changes in Main Repo.
    pause
    color %COLOR_RESET%
    exit /b 1
)
color %COLOR_LEAVE%
echo Leaving Main Repo...
color %COLOR_RESET%
echo.

REM Pushing changes
color %COLOR_INFO%
echo Pushing changes to remote for all modules...
echo.

REM Public repo
color %COLOR_ENTER%
echo Entering Assets/Public...
cd /d "X:/Spirits Rising/Assets/Public"
git push origin %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error pushing changes to Assets/Public.
    pause
    color %COLOR_RESET%
    exit /b 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Public...
color %COLOR_RESET%
echo.

REM Private repo
color %COLOR_ENTER%
echo Entering Assets/Private...
cd /d "X:/Spirits Rising/Assets/Private"
git push origin %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error pushing changes to Assets/Private.
    pause
    color %COLOR_RESET%
    exit /b 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Leaving Assets/Private...
color %COLOR_RESET%
echo.

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
git push origin %BRANCH_NAME%
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error pushing changes to Main Repo.
    pause
    color %COLOR_RESET%
    exit /b 1
)
color %COLOR_LEAVE%
echo Leaving Main Repo...
color %COLOR_RESET%
echo.

color %COLOR_SUCCESS%
echo Push complete for all modules.
echo.
echo 07 > "X:/Spirits Rising/.gitupdate/.iteratorcheck"

color %COLOR_RESET%
exit /B