@echo off
mode 70,40
color 70
if defined __ goto :launched
set __=.
call %0 %* | darkbox
set __=
goto :eof
 
:launched
title Ozachi Ping Graphics
setlocal enabledelayedexpansion
:: Ping Graphics by Ozachi - 2018
:: === Values ===
:: IP:
set ip=google.com
:: Delay between the pings:
set delay=1

echo -h 0 -3gcd 0 1 0x75 "=== Ozachi Ping Graphics ===" 0 2 0x79 "Thank you to use me^! Github:" 0 3 0x79 "https://github.com/OzachiDev"
call :inigraph
:loop
for /f "tokens=1-4 delims== " %%1 in ('ping %ip% -n 1') do set ms=%%4
if "%ms:~-1%"=="," set ms=%ms:~0,-3%
call :graph "!ms!"
if %graphx% EQU 60 call :inigraph
timeout %delay% /nobreak >nul
goto :loop
:inigraph
set graphx=4
echo -c 0xFF
for /l %%1 in (7, 1, 39) do echo -g 0 %%1 -d "                                                                      "
echo -cgd 0x0B 0 39 "0" -cgd 0xFA 0 34 "50" -cgd 0x0E 0 29 "100" -cgd 0xF6 0 24 "150" -cgd 0x0C 0 19 "200" -cgd 0xF4 0 14 "250" -cgd 0x0F 0 9 "300"
goto :eof
:graph
if %~1 GTR 2147483647 (set /a graphx+=1&echo -gcd 0 4 0x70 "[%time:~0,-3%] Last ping : unreachable"&goto :eof)
echo -gcd 0 4 0x70 "[%time:~0,-3%] Last ping : %~1ms        "
set /a y=39-%~1/10
if %y% LSS 9 set y=9
if %~1 GEQ 0 set c=B
if %~1 GTR 50 set c=A
if %~1 GTR 100 set c=E
if %~1 GTR 150 set c=6
if %~1 GTR 200 set c=C
if %~1 GTR 250 set c=4
echo -c 0x%c%%c%
for /l %%1 in (39, -1, %y%) do echo -g %graphx% %%1 -d "X"
set /a graphx+=1
goto :eof