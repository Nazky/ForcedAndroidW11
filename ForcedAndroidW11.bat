@echo off
title ForcedAndroidW11 - v0.2
cd %temp%
goto :MENU

:MENU
echo ---------------------------------
echo -        ForcedAndroidW11       -
echo -  A script to install the WSA  -
echo -         With GAPPS :)         -
echo ---------------------------------
echo -          By @NazkyYT          -
echo ---------------------------------
REM echo Wokring Directory : %temp%



echo.

echo MAKE SUR TO RUN THIS SCRIPT IN ADMIN MODE !!!!

echo.
echo IF YOU HAVE ANDROID ALEARDY INSTALL YOU NEED TO UNISTALL IT BEFORE CONTINUED !!!!

echo.
echo.

echo 1 - Run all 
echo 2 - Enable devloper mode 
echo 3 - Download WSA with GAPPS
echo 4 - Install WSA with GAPPS
echo 5 - Fix Google Sign in 
echo.

set /P var="Please select a numaber : "

if %var% == 1 goto :ALL 
if %var% == 2 goto :DEVM
if %var% == 3 goto :DWSA
if %var% == 4 goto :IWSA
if %var% == 5 goto :FG

echo Please choose a right numaber 

pause

cls
goto :MENU

:DEVM
echo Enable devmode...

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
DISM /Online /Add-Capability /CapabilityName:Tools.DeveloperMode.Core

echo Devmode Enable
echo.
echo You maybe have to restart after this !

echo.
pause

goto :MENU

:DWSA
echo Download file...

powershell [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String('aHR0cHM6Ly9iaXQubHkvMllxVThyWg==')) > output

set /p url=<output

del output

powershell Invoke-WebRequest %url% -o WSA.zip

echo Download Finish

echo Extract archive...

powershell Expand-Archive -path "WSA.zip" "WSA"

echo Archive Extracted

echo.

pause

goto :MENU

:IWSA
echo Install WSA...

powershell Add-AppxPackage -Register "WSA/WSA-Patched/AppxManifest.xml"

echo WSA Installed
echo.

pause
goto :MENU

:FG

if exist ADB\ (
    echo Fix Sign in...
    echo Activate the devloper mode on the WSA and run it once before continued !!!!!
    pause
    cd ADB/platform-tools

    adb connect 127.0.0.1:58526 && adb shell "su -c 'setenforce 0'"  

    echo Google Sign In Fixed
    pause

    goto :MENU

) else (
    echo Fixing Google sign in...
    echo Download ADB...

    powershell Invoke-WebRequest "https://dl.google.com/android/repository/platform-tools-latest-windows.zip" -o adb.zip

    echo Extract ADB...
    powershell Expand-Archive -path "adb.zip" "ADB"

    echo Fix Sign in...
    echo Activate the devloper mode on the WSA and run it once before continued !!!!!
    pause
    cd ADB/platform-tools

    adb connect 127.0.0.1:58526 && adb shell "su -c 'setenforce 0'"    
    
    echo Google Sign In Fixed

    pause

    goto :MENU
)

pause

:ALL

echo Enable devmode...

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
DISM /Online /Add-Capability /CapabilityName:Tools.DeveloperMode.Core

echo Devmode Enable
echo.
echo You maybe have to restart after this !

echo.

echo Download file...

powershell [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String('aHR0cHM6Ly9iaXQubHkvMllxVThyWg==')) > output

set /p url=<output

del output

powershell Invoke-WebRequest %url% -o WSA.zip

echo Download Finish

echo Extract archive...

powershell Expand-Archive -path "WSA.zip" "WSA"

echo Archive Extracted

echo.

echo Install WSA...

powershell Add-AppxPackage -Register "WSA/WSA-Patched/AppxManifest.xml"

echo WSA Installed
echo.

if exist ADB\ (
    echo Fix Sign in...
    echo Activate the devloper mode on the WSA and run it once before continued !!!!!
    pause
    cd ADB/platform-tools

    adb connect 127.0.0.1:58526 && adb shell "su -c 'setenforce 0'"  

    echo Google Sign In Fixed
  
    echo.

) else (
    echo Fixing Google sign in...
    echo Download ADB...

    powershell Invoke-WebRequest "https://dl.google.com/android/repository/platform-tools-latest-windows.zip" -o adb.zip

    echo Extract ADB...
    powershell Expand-Archive -path "adb.zip" "ADB"

    echo Fix Sign in...
    echo Activate the devloper mode on the WSA and run it once before continued !!!!!
    pause
    cd ADB/platform-tools

    adb connect 127.0.0.1:58526 && adb shell "su -c 'setenforce 0'"    
    
    echo Google Sign In Fixed

    echo.
)

pause
