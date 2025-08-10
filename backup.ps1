$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$dest = ".\backups"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
$zip = Join-Path $dest "homehub-$stamp.zip"
$toBackup = @(
  ".\docker-compose.yml",
  ".\.env",
  ".\nginx",
  ".\homer\assets",
  ".\homeassistant\config",
  ".\habridge\config",
  ".\DaddyLiveHD"
)
Compress-Archive -Path $toBackup -DestinationPath $zip -Force
Write-Host "Backup written to $zip"
