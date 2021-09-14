#Requires -RunAsAdministrator

##################################################
# The script will install Boxstarter, Chocolatey,
# Setup Network Discovery and File Sharing, Git,
# and download the main "psmodule" Git repo
##################################################

###############################
# Elevate permissions
###############################
# Open PowerShell command with Admin priviledges
# Paste the below line in the shell and execute it
# Then run this script again
Set-ExecutionPolicy Unrestricted -Scope Process -Force

###############################
# Intall Boxstarter/Chocolatey
###############################
. { Invoke-WebRequest -useb https://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; Get-Boxstarter -Force

###############################
# Services requirements
###############################

Write-Host "Enable Services for Network Discovery and File Sharing" -ForegroundColor Yellow
if (!(Get-Service -DisplayName "Function Discovery Resource Publication")) {
    Get-Service -DisplayName "Function Discovery Resource Publication" | Start-Service
}
if (!(Get-Service -DisplayName "DNS Client")) {
    Get-Service -DisplayName "DNS Client"  | Start-Service
}
if (!(Get-Service -DisplayName "SSDP Discovery")) {
    Get-Service -DisplayName "SSDP Discovery"  | Start-Service
}
if (!(Get-Service -DisplayName "UPnP Device Host")) {
    Get-Service -DisplayName "UPnP Device Host" | Start-Service
}

Write-Host "#####################################################" -ForegroundColor Yellow
Write-Host "Firewall requirements" -ForegroundColor Yellow
Write-Host "#####################################################" -ForegroundColor Yellow

Write-Host "Enable firewall for Network Discovery" -ForegroundColor Yellow
Get-NetFirewallRule -DisplayGroup "Network Discovery" | Set-NetFirewallRule -Action Allow
Get-NetFirewallRule -DisplayGroup "Network Discovery" | Enable-NetFirewallRule

Write-Host "Enable firewall for File Sharing" -ForegroundColor Yellow
Get-NetFirewallRule -DisplayGroup "File and Printer Sharing" | Set-NetFirewallRule -Action Allow 
Get-NetFirewallRule -DisplayGroup "File and Printer Sharing" | Enable-NetFirewallRule

Write-Host "#####################################################" -ForegroundColor Yellow
Write-Host "Git Bash Setup" -ForegroundColor Yellow
Write-Host "#####################################################" -ForegroundColor Yellow
choco install -y git -params '"/NoGuiHereIntegration"'
git config --global user.name "aamitabh"
git config --global user.email amitabh.arora@gmail.com

Write-Host "#####################################################" -ForegroundColor Yellow
Write-Host "Download bash startup file" -ForegroundColor Yellow
Write-Host "#####################################################" -ForegroundColor Yellow
if (-not (Test-Path "$home\.bashrc")) {
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/bash-startup-files/.bashrc -OutFile "$home\.bashrc"
}
if (-not (Test-Path "$home\.bash_aliases")) {
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/bash-startup-files/.bash_aliases -OutFile "$home\.bash_aliases"
}
if (-not (Test-Path "$home\.bash_profile")) {
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/bash-startup-files/.bash_profile -OutFile "$home\.bash_profile"
}

Write-Host "#####################################################" -ForegroundColor Yellow
Write-Host "Generate ssh keys for password-less GIT" -ForegroundColor Yellow
Write-Host "#####################################################" -ForegroundColor Yellow
if (-not (Test-Path "$home\.ssh\id_rsa")) {
    ssh-keygen -t rsa -b 4096 -C "amitabh.arora@gmail.com"
    eval "$(ssh-agent -s)"
}

Write-Host "#####################################################" -ForegroundColor Yellow
Write-Host "Deprecated" -ForegroundColor Red
Write-Host "Add git path to environment" -ForegroundColor Yellow
Write-Host "#####################################################" -ForegroundColor Yellow
# $gitinpath = $env:path.split(";") | Select-String -Pattern git | Select-String -Pattern "program Files"
# if (!($gitinpath)) {
#     $env:path="$env:path;C:\Program Files\Git\cmd"
# }
# refreshenv

# TODO: Setup .bashrc environment variables

# TODO: Copy .ssh keys from host

Write-Host "#####################################################" -ForegroundColor Yellow
Write-Host "Pull down psmodule repo" -ForegroundColor Yellow
Write-Host "#####################################################" -ForegroundColor Yellow
$repos = $env:REPO_HOME
if (-not (Test-Path "$repos\infra")) {
    New-Item -Path "$repos\infra" -ItemType Directory
}
if (!(Test-Path "$repos\infra\psmodule")) {
    Set-Location "$repos\infra"
    git clone "git@github.com:aamitabhinfra/psmodules.git"
} else {
    Set-Location "$repos\infra\psmodules"
    git fetch
}
# git clone "git@github.com:aamitabhinfra/psmodules.git"