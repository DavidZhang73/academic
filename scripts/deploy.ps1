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
hugo.exe -D

Write-Host "===================="
Write-Host "Git push the generated static site"
Set-Location public
git add .
git commit -am $Message
git push -u origin master
git push -u gitea master

Write-Host "===================="
Write-Host "Git pull from server"
ssh root@davidz.cn bash -c "cd /docker/academic/ && git pull"

Set-Location $CurrentWorKDir