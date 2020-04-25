Write-Host "-----------------------------------------" -Foreground Green
Write-Host "Install bootstrap: Boxstarter/Choco, etc." -Foreground Green
Write-Host "-----------------------------------------" -Foreground Green
Set-ExecutionPolicy Unrestricted -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/bootstrap.ps1'))

Write-Host "----------------------------" -Foreground Green
Write-Host "Install base applicaitons" -Foreground Green
Write-Host "----------------------------" -Foreground Green
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/Install-Base.txt

Write-Host "-----------------------------" -Foreground Green
Write-Host "Install specific applicaitons" -Foreground Green
Write-Host "-----------------------------" -Foreground Green
choco install -y audacity
choco install -y audacity-lame
choco install -y ffmpeg
choco install -y mediainfo