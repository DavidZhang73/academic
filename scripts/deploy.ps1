$CurrentWorKDir = Get-Location
$CurrentDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$Message = "Site updated: $(Get-Date -Format 'yyyy-M-d H:m:s')"
Write-Host $Message


Write-Host "===================="
Write-Host "Git push the resources"
Set-Location $CurrentDir
Set-Location ..
git add .
git commit -am $Message
git push

Write-Host "===================="
Write-Host "Generate static site"
# hugo.exe -D

Write-Host "===================="
Write-Host "Git push the generated static site"
# Set-Location public
# Get-Location

Set-Location $CurrentWorKDir