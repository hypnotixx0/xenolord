# Xeno Installer v1.3.40
# One-line usage: iex (irm 'https://raw.githubusercontent.com/yourusername/yourrepo/main/xeno-installer.ps1')

$Host.UI.RawUI.WindowTitle = "Xeno Installer - Unhiin"
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
Clear-Host

Write-Host ""
Write-Host "  =========================================="
Write-Host "           XENO INSTALLER v1.3.40"
Write-Host "  =========================================="
Write-Host ""

$downloadUrl = "https://github.com/hypnotixx0/xenolord/blob/main/Xeno-v1.3.40.zip"
$outputPath = "$env:USERPROFILE\Downloads\Xeno-v1.3.40.zip"

Write-Host "  [*] Initializing download process..."
Start-Sleep -Seconds 2

Write-Host "  [*] Connecting to server..."
Start-Sleep -Seconds 1

Write-Host "  [*] Preparing to download Xeno v1.3.40..."
Start-Sleep -Seconds 1

Write-Host ""
Write-Host "  [*] Downloading: Xeno-v1.3.40.zip"
Write-Host "  [*] Destination: Downloads folder"
Write-Host ""

try {
    Invoke-WebRequest -Uri $downloadUrl -OutFile $outputPath
    
    Write-Host "  [*] Download complete!"
    Write-Host ""
    Write-Host "  =========================================="
    Write-Host "   Installation finished, thanks for"
    Write-Host "   choosing Xeno! You can close this"
    Write-Host "   window now."
    Write-Host "  =========================================="
} catch {
    Write-Host ""
    Write-Host "  [ERROR] Download failed. Check your connection."
}

Write-Host ""
