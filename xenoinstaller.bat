@echo off
title Xeno Installer - Unhiin v1.3.40
color 07
mode con: cols=60 lines=20

echo.
echo  ==========================================
echo           XENO INSTALLER v1.3.40
echo  ==========================================
echo.

set "download_url=https://github.com/hypnotixx0/xenolord/raw/main/Xeno-v1.3.40.zip"
set "output_path=%USERPROFILE%\Downloads\Xeno-v1.3.40.zip"

echo  [*] Initializing download process...
timeout /t 2 /nobreak >nul

echo  [*] Connecting to server...
timeout /t 1 /nobreak >nul

echo  [*] Preparing to download Xeno v1.3.40...
timeout /t 1 /nobreak >nul

echo.
echo  [*] Downloading: Xeno-v1.3.40.zip
echo  [*] Destination: Downloads folder
echo.

powershell -Command "Invoke-WebRequest -Uri '%download_url%' -OutFile '%output_path%'"

if exist "%output_path%" (
    echo  [*] Download complete!
    echo.
    echo  ==========================================
    echo   Installation finished, thanks for
    echo   choosing Xeno! You can close this
    echo   window now.
    echo  ==========================================
) else (
    echo  [ERROR] Download failed. Check your connection.
)

echo.
pause >nul