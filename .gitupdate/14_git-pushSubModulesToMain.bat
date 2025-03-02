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

REM Ask user for commit message
color %COLOR_PROMPT%
set /p COMMIT_MESSAGE=Enter commit message (can be empty): 
color %COLOR_RESET%

REM Check if user input is empty and allow empty commits
if "%COMMIT_MESSAGE%"=="" (
    echo Commit message is empty. Will instead be ^"Update commit refs for submodules Assets/Public/ and Assets/Private/^"
    set COMMIT_MESSAGE="Update commit refs for submodules Assets/Public/ and Assets/Private/"
)

echo Pushing submodule refs update for Main with Commit Message: ^"%COMMIT_MESSAGE%^"...
echo.

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
cd /d "X:/Spirits Rising"
git commit -m %COMMIT_MESSAGE% --allow-empty
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

REM Main repo
color %COLOR_ENTER%
echo Entering Main Repo...
git push origin main
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
echo Push submodules complete for main.
echo.
echo 01 > "X:/Spirits Rising/.gitupdate/.iteratorcheck"

color %COLOR_RESET%
exit /B