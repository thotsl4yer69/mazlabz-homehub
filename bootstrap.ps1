$ErrorActionPreference = 'Stop'

# Be robust: works whether run as a script or pasted
$here = if ($PSScriptRoot) { $PSScriptRoot } else { Get-Location }
Set-Location $here

# Ensure expected folders exist
$paths = @(
  ".\nginx", ".\www\spotify", ".\homer\assets",
  ".\homeassistant\config", ".\habridge\config",
  ".\DaddyLiveHD\data"
)
$paths | ForEach-Object { New-Item -ItemType Directory -Force -Path $_ | Out-Null }

Write-Host "Starting docker build & up..." -ForegroundColor Cyan
docker compose up -d --build --force-recreate

Start-Sleep -Seconds 8

Write-Host "`nSmoke tests:" -ForegroundColor Yellow
$rootOK = $false
$hassOK = $false

try {
  $resp = Invoke-WebRequest -UseBasicParsing http://localhost:8080/healthz -TimeoutSec 5
  if ($resp.StatusCode -eq 200) { $rootOK = $true }
} catch { }

try {
  $resp2 = Invoke-WebRequest -UseBasicParsing http://localhost:8080/hass/ -TimeoutSec 5
  if ($resp2.StatusCode -in 200,301,302) { $hassOK = $true }
} catch { }

$rootMsg = if ($rootOK) { "OK" } else { "FAIL" }
$hassMsg = if ($hassOK) { "OK" } else { "WARN" }

Write-Host (" - Nginx healthz:     " + $rootMsg)
Write-Host (" - HA subpath ping:   " + $hassMsg)

Write-Host "`nOpen:" -ForegroundColor Cyan
Write-Host "  - Homer:          http://localhost:8080/home/"
Write-Host "  - StepDaddy root: http://localhost:8080/"
Write-Host "  - Home Assistant: http://localhost:8080/hass/"
Write-Host "  - HA-Bridge:      http://localhost:8080/habridge/  (direct: http://localhost:8085/)"
