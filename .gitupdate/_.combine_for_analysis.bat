@echo off
setlocal enabledelayedexpansion

:: Define output file
set OUTPUT_FILE=combined.txt

:: Clear the output file before appending
echo. > "%OUTPUT_FILE%"

:: Loop through all .bat files in the directory
for %%F in (*.bat) do (
    echo ================================ >> "%OUTPUT_FILE%"
    echo File: %%F >> "%OUTPUT_FILE%"
    echo ================================ >> "%OUTPUT_FILE%"
    type "%%F" >> "%OUTPUT_FILE%"
    echo. >> "%OUTPUT_FILE%"  :: Add a blank line between files
)

echo Done! Combined all batch files into "%OUTPUT_FILE%"
