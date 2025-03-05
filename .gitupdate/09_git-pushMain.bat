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

echo Pushing main...
echo.

REM Public Repo
color %COLOR_ENTER%
echo Switching to main in Assets/Public...
cd /d "X:/Spirits Rising/Assets/Public"
git push origin main
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error merging "%BRANCH_NAME%" in Assets/Public.
    pause
    color %COLOR_RESET%
    exit /b 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Merge complete for Assets/Public.
echo.

REM Private Repo
color %COLOR_ENTER%
echo Switching to main in Assets/Private...
cd /d "X:/Spirits Rising/Assets/Private"
git push origin main
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error merging "%BRANCH_NAME%" in Assets/Private.
    pause
    color %COLOR_RESET%
    exit /b 1
)
cd /d "X:/Spirits Rising"
color %COLOR_LEAVE%
echo Merge complete for Assets/Private.
echo.

REM Main Repo
color %COLOR_ENTER%
echo Switching to main in Main Repo...
cd /d "X:/Spirits Rising"
echo Merging "%BRANCH_NAME%" into main...
git push origin main
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error merging "%BRANCH_NAME%" into main in Main Repo.
    pause
    color %COLOR_RESET%
    exit /b 1
)
color %COLOR_LEAVE%
echo Merge complete for Main Repo.
echo.

color %COLOR_SUCCESS%
echo Push process completed successfully for all repositories.
echo.
echo 10 > "X:/Spirits Rising/.gitupdate/.iteratorcheck"

color %COLOR_RESET%
exit /B
