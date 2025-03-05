@echo off
cd /d "X:/Spirits Rising"

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

color %COLOR_ENTER%

REM =======================================================
REM Check if .iterator exists, otherwise start from step 01
REM =======================================================
if not exist "X:/Spirits Rising/.gitupdate/.iterator" GOTO :CreateFiles
if not exist "X:/Spirits Rising/.gitupdate/.iteratorCheck" GOTO :CreateFiles
GOTO :Start

:CreateFiles
echo 01 > "X:/Spirits Rising/.gitupdate/.iterator"
echo 01 > "X:/Spirits Rising/.gitupdate/.iteratorCheck"
echo main > "X:/Spirits Rising/.gitupdate/.workingBranch"

:Start
REM ===================================
REM Get the current step from .iterator
REM ===================================
set /p ITERATOR=<"X:/Spirits Rising/.gitupdate/.iterator"
set /p ITERATORCHECK=<"X:/Spirits Rising/.gitupdate/.iteratorCheck"
set /p WORKINGBRANCH=<"X:/Spirits Rising/.gitupdate/.workingBranch"

REM =====================================
REM Check the current step from .iterator
REM =====================================
if %ITERATOR% NEQ %ITERATORCHECK% (
    color %COLOR_FAIL%
    echo "Iterator Check Failed, manually investigate!"
    pause
    exit /B 1
)

REM ==================================================
REM Confirm current step and ask for user confirmation
REM ==================================================
REM echo.
REM echo ==============================
REM echo Current Step: %ITERATOR%
REM echo ==============================
REM echo.

color %COLOR_ENTER%
REM Master workflow loop
if %ITERATOR%==01 goto Step01
if %ITERATOR%==02 goto Step02
if %ITERATOR%==03 goto Step03
if %ITERATOR%==04 goto Step04
if %ITERATOR%==05 goto Step05
if %ITERATOR%==06 goto Step06
if %ITERATOR%==07 goto Step07
if %ITERATOR%==08 goto Step08
if %ITERATOR%==09 goto Step09
if %ITERATOR%==10 goto Step10
if %ITERATOR%==11 goto Step11
if %ITERATOR%==12 goto Step12
if %ITERATOR%==13 goto Step13
if %ITERATOR%==14 goto Step14

:Step01
echo ===================================
echo Step 01: Fetch all for branch: Main
echo ===================================
call "X:/Spirits Rising/.gitupdate/01_git-fetchAll.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 01. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 02 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 01 complete, ready for Step 02.
echo ====================================
goto End

:Step02
echo ==================================
echo Step 02: Pull all for branch: Main
echo ==================================
call "X:/Spirits Rising/.gitupdate/02_git-pullAll.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 02. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 03 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 02 complete, ready for Step 03.
echo ====================================
goto End

:Step03
echo ============================================
echo Step 03: Create new branch from branch: Main
echo ============================================
call "X:/Spirits Rising/.gitupdate/03_git-branchCreate.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 03. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 04 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 03 complete, ready for Step 04.
echo ====================================
goto End

:Step04
echo ===================================================
echo Step 04: Add all changes to branch: %WORKINGBRANCH%
echo ===================================================
call "X:/Spirits Rising/.gitupdate/04_git-addAll_BRANCH.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 04. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 05 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 04 complete, ready for Step 05.
echo ====================================
goto End

:Step05
echo ================================================
echo Step 05: Check status of branch: %WORKINGBRANCH%
echo ================================================
call "X:/Spirits Rising/.gitupdate/05_git-statusAll_BRANCH.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 05. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 06 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 05 complete, ready for Step 06.
echo ====================================
goto End

:Step06
echo ===========================================
echo Step 06: Push all for branch: %WORKINGBRANCH%
echo ===========================================
REM Prompt the user for confirmation
echo About to commit and push all current changes on branch: %WORKINGBRANCH%
set /p user_input=Do you wish to proceed? (Y/N): 

REM Check the input and act accordingly
if /i "%user_input%"=="Y" (
    echo Proceeding with the step...
    REM Add the commands for the next step here
) else if /i "%user_input%"=="N" (
    echo Aborting the step...
    exit /B 1
) else (
    echo Invalid input. Please launch the script again and chose "Y" if you want to continue!
    pause
    exit /B 1
)


call "X:/Spirits Rising/.gitupdate/06_git-pushAll_BRANCH.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 06. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 07 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 06 complete, ready for Step 07.
echo ====================================
goto End

:Step07
echo =================================================
echo Step 07: Checkout main from branch: %WORKINGBRANCH%
echo =================================================
call "X:/Spirits Rising/.gitupdate/07_git-checkoutMain.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 07. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 08 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 07 complete, ready for Step 08.
echo ====================================
goto End

:Step08
echo =======================
echo Step 08: Pull from Main
echo =======================
call "X:/Spirits Rising/.gitupdate/08_git-pullMain.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 08. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 09 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 08 complete, ready for Step 09.
echo ====================================
goto End

:Step09
echo ============================================
echo Step 09: Marge branch: %WORKINGBRANCH% to Main
echo ============================================
call "X:/Spirits Rising/.gitupdate/09_git-mergeMain.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 09. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 10 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 09 complete, ready for Step 10.
echo ====================================
goto End

:Step10
echo =======================================
echo Step 10: Delete branch: %WORKINGBRANCH%
echo =======================================
call "X:/Spirits Rising/.gitupdate/10_git-delete_BRANCH.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 10. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 11 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 10 complete, ready for Step 11.
echo ====================================
goto End

:Step11
echo ==================
echo Step 11: Push Main
echo ==================
call "X:/Spirits Rising/.gitupdate/11_git-pushMain.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 11. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 12 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 11 complete, ready for Step 12.
echo ====================================
goto End

:Step12
echo ===============================
echo Step 12: Add Submodules to Main
echo ===============================
call "X:/Spirits Rising/.gitupdate/12_git-addSubModulesToMain.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 12. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 13 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 12 complete, ready for Step 13.
echo ====================================
goto End

:Step13
echo =======================================
echo Step 13: Status Sub Module refs to Main
echo =======================================
call "X:/Spirits Rising/.gitupdate/13_git-statusMain.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 13. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 14 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo ====================================
echo Step 13 complete, ready for Step 14.
echo ====================================
goto End

:Step14
echo =====================================
echo Step 14: Push Sub Module Refs to Main
echo =====================================
call "X:/Spirits Rising/.gitupdate/14_git-pushSubModulesToMain.bat"
if %ERRORLEVEL% neq 0 (
    color %COLOR_FAIL%
    echo Error during Step 14. Aborting...
    pause
    exit /B 1
)
color %COLOR_LEAVE%
echo 01 > "X:/Spirits Rising/.gitupdate/.iterator"
color %COLOR_SUCCESS%
echo.
echo.
echo.
echo =====================================
echo Step 14 complete   WORKFLOW COMPLETE!
echo =====================================
echo.
echo.
echo.
goto End

:End
echo.
pause
