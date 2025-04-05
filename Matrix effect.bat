@echo off
REM Set the console text color (Green on Black)
color 02

REM Enable delayed variable expansion for dynamic variable usage
setlocal enabledelayedexpansion

:loop
REM Initialize an empty line variable
set "line="

REM Generate 20 random numbers and append them to the line
for /l %%i in (1,1,20) do (
    set "line=!line! %random%"
)

REM Output the concatenated random numbers
echo !line!

REM Optional: Uncomment the next line to add a 1-second delay between iterations
REM timeout /t 1 /nobreak >nul

REM Loop back to repeat
goto loop
