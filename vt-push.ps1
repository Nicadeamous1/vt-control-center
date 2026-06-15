<#
.SYNOPSIS
  Commits the current index.html and pushes to GitHub.

.PARAMETER Message
  Optional commit message. Defaults to a timestamp-based one.

.EXAMPLE
  .\vt-push.ps1
  .\vt-push.ps1 "logged slice 6 payment fix"
#>
param(
    [string]$Message = ""
)

$ErrorActionPreference = "Stop"

# Always run from the script's own directory so it works no matter where you invoke it from.
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

# Default message: timestamp.
if ([string]::IsNullOrWhiteSpace($Message)) {
    $stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    $Message = "status update $stamp"
}

# Stage the HTML (the only thing that changes from log calls).
git add index.html

# If nothing actually changed, exit cleanly.
$staged = git diff --cached --name-only
if (-not $staged) {
    Write-Host "Nothing to commit. index.html is already up to date." -ForegroundColor Yellow
    exit 0
}

git commit -m $Message
git push

Write-Host ""
Write-Host "Pushed. Live page rebuild usually takes ~30 seconds." -ForegroundColor Green
Write-Host "https://nicadeamous1.github.io/vt-control-center/" -ForegroundColor Cyan
