Write-Host "-----------------------------------------" -ForegroundColor Yellow
Write-Host "Install bootstrap: Boxstarter/Choco, etc." -ForegroundColor Yellow
Write-Host "-----------------------------------------" -ForegroundColor Yellow
Set-ExecutionPolicy Unrestricted -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/bootstrap.ps1'))

Write-Host "-----------------------------" -ForegroundColor Yellow
Write-Host "Install Fonts" -ForegroundColor Yellow
Write-Host "-----------------------------" -ForegroundColor Yellow
# Reference: https://github.com/microsoft/cascadia-code/wiki/Installing-Cascadia-Code
choco install -y cascadiafonts

Write-Host "----------------------------" -ForegroundColor Yellow
Write-Host "Install base applicaitons" -ForegroundColor Yellow
Write-Host "----------------------------" -ForegroundColor Yellow
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/base.ps1

Write-Host "-----------------------------" -ForegroundColor Yellow
Write-Host "Install Applicaitons" -ForegroundColor Yellow
Write-Host "-----------------------------" -ForegroundColor Yellow

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling a few apps"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow

choco install -y audacity
choco install -y audacity-lame
choco install -y ffmpeg
choco install -y mediainfo
choco install -y adobereader