@echo off
title Cleanup n Backup v0.1
color 0a
:big
cls
echo 1.System Cleanup
echo 2.Backup
echo 3.About
echo.
echo.
echo 4.Exit
set /p cho=
if %cho%==1 goto :sys
if %cho%==2 goto :back
if %cho%==3 goto :abt
if %cho%==4 goto :exit
:abt
cls
                                    
echo.
echo This Application is pure open source. You can Find the application source via contacting the author Bhashit Pandya at
echo bpandya97@gmail.com and fb.com/bhashit.pandya
echo BUG:
echo To report any kind of BUG you can contact with the above details! We appriciate your time to report us the issue in the application if any.
echo NOTE: This utility is just for Windows 7. Windows 10 update is yet to be added.
pause
goto :big
:sys
cls
echo 1.Browser cleanup
echo 2.Files Cleanup
echo.
echo 3.Back
set /p cho1=
if %cho1%==1 goto :bro
if %cho1%==2 goto :file
if %cho1%==3 goto :big
pause
goto :sys
:bro
cls
echo Describtion:
echo This will remove all the History,Download History,cookies and caches of the browsers here below. 
echo Please chosse any.
echo 1.Chrome
echo 2.Firefox
echo 3.Both
echo.
echo.
echo 4.Back
set /p cho11=
if %cho11%==1 goto :ch 
if %cho11%==2 goto :ff
if %cho11%==3 goto :bot
if %cho11%==4 goto :sys
pause
goto :bro
:bot
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data   
del /q /s /f "%ChromeDir%"

::-------------------

:: Clear Mozila Firefox 
color 0a
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles
del /q /s /f "%DataDir%"

for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite
::-------------------
pause
goto :bro
:ff
:: Batch script to clear browsing history, download history, and empty the cache for Mozila Firefox.
:: Script can be run via GFI MAX RM 
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles
del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"
for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite
cls
IF %ERRORLEVEL%==0 (
echo "Removed History,Download History,Cache"
timeout 10
) ELSE (
echo "Error Message"
goto bro
)
goto :bro
:ch
cls
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data
del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"
cls
IF %ERRORLEVEL%==0 (
echo "Removed History,Download History,Cache"
timeout 10
) ELSE (
echo "Error Message"
)
pause
goto bro
:file
cls
echo Describtion:
echo This will Clean your system pluse defragment it too for efficient access and increasing up the memory space!
echo.
echo Do u want to clean now?(Y/N)
set /p ask=
if %ask%==y goto :clean
if %ask%==Y goto :clean
if %ask%==n goto :sys
if %ask%==N goto :sys 
pause
goto :file  
:clean
cls
DEL /F /S /Q %TEMP%
del "%tmp%" /s /q
del "%temp%" /s /q
del C:\*.tmp /s /q
del /Q /F "%USERPROFILE%\LocalSettings\Temp\*.*
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
del c:\windows\tempor~1
del c:\windows\temp
del c:\windows\tmp
del c:\windows\ff*.tmp
del c:\windows\history
del c:\windows\cookies
del c:\windows\spool\printers
del c:\WIN386.SWP
::cookies
del /Q /F "%USERPROFILE%\Cookies"
::History
del "%userprofile%\local settings\history\" 
cd\    
echo. Cleaning Prefetch Files
cd %windir%\prefetch
del /s /q *.* |echo. >nul
cd\
echo. Cleaning Temprory Files
cd %USERPROFILE%\Local Settings\Temporary Internet Files
del /f /s /q  /a s *.* |echo. >nul
cd..
rd /s /q Temp |echo. >nul
rd /s /q History |echo. >nul
MD Temp
cd\
del /s /q *.tmp
echo.
echo. Please Wait More For Last Cleanup
del /s /q *.chk |echo. >nul
echo/
echo.
CLS
C:
CD \
echo Warning: Do not use the X button to close. Press CTRL+C to Abort and press Y to Close...

echo Removing All temp Files from C: drive
Del *.tmp /s /Q
Del *.temp /s /Q

echo Removing all log Files From C: drive
Del *.log /s /Q

CLS

REM Defragmenting C: drive
echo Defragmanting C drive... Press CTRL+C To abort and press y to close...
defrag c: /h /x

REM Checking System Files Integrity
echo Checking System Files Integrity... Press CTRL+C To abort and press y to close...
SFC /Scannow
pause
goto :big
:back
cls
echo This back ups the given patch directory to E:\backup
echo 1.Define folder
echo 2.Back
set /p cho2=
if %cho2%==1 goto :df
if %cho2%==2 goto :big
pause
:df
cd E:
echo Give folder path here:
set /p path1=
XCOPY "%path1%" "E:\backup" /s/h/e/k/f/c
echo copied successfully!
pause
goto back
:exit
exit
