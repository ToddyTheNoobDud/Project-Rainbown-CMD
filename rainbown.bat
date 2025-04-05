@echo off
title Rainbow CMD
color 07  // Reset to default colors
setlocal enabledelayedexpansion  // Enable delayed variable expansion

:: Enable ANSI escape codes
if "%ANSICON%"=="" (
    for /f %%a in ('"prompt $H & for %%b in (1) do rem"') do set "ESC=%%a"
) else (
    set "ESC=<ESC>"
)

:: Function to cycle colors
:rainbow
cls
echo Rainbow CMD - Press Ctrl+C to exit
echo.
echo You can still type commands here!
echo.

:: Loop through colors
for %%C in (
    0A 0B 0C 0D 0E 0F
    1A 1B 1C 1D 1E 1F
    2A 2B 2C 2D 2E 2F
    3A 3B 3C 3D 3E 3F
    4A 4B 4C 4D 4E 4F
    5A 5B 5C 5D 5E 5F
    6A 6B 6C 6D 6E 6F
    7A 7B 7C 7D 7E 7F
    8A 8B 8C 8D 8E 8F
    9A 9B 9C 9D 9E 9F
    AA AB AC AD AE AF
    BA BB BC BD BE BF
    CA CB CC CD CE CF
    DA DB DC DD DE DF
    EA EB EC ED EE EF
    FA FB FC FD FE FF
) do (
    color %%C
    :: Rainbow text using ANSI escape codes
    echo !ESC![38;5;%%CmThis is rainbow text!ESC![0m
    timeout /t 1 /nobreak >nul
    :: Check for user input
    set "input="
    set /p "input=Enter command: "
    if not "!input!"=="" (
        call :execute_command "!input!"
    )
)

goto rainbow

:: Function to execute user commands
:execute_command
setlocal
set "command=%~1"
echo Executing: %command%
%command%
endlocal
goto :eof
