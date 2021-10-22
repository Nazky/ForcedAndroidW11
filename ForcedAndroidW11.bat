@echo off
title ForcedAndroidW11
echo ---------------------------------
echo -        ForcedAndroidW11       -
echo -  A script to install the WSA  -
echo -         ONLY FOR W11          -
echo ---------------------------------
echo -          By @NazkyYT          -
echo ---------------------------------



echo.
echo.

pause

powershell [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String('aHR0cHM6Ly9iaXQubHkvM3ZCQTZhZA==')) > output

set /p url=<output

powershell Invoke-WebRequest %url% -o MicrosoftCorporationII.WindowsSubsystemForAndroid_1.7.32815.0_neutral_~_8wekyb3d8bbwe.msixbundle

echo Download Finish

del output

powershell Add-AppxPackage -Path MicrosoftCorporationII.WindowsSubsystemForAndroid_1.7.32815.0_neutral_~_8wekyb3d8bbwe.msixbundle

echo Package Install

pause
