#Requires -RunAsAdministrator

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

Write-Host "Enable Services for Network Discovery and File Sharing" -ForegroundColor Green
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

###############################
# Firewall requirements
###############################
Write-Host "Enable firewall for Network Discovery" -ForegroundColor Green
Get-NetFirewallRule -DisplayGroup "Network Discovery" | Set-NetFirewallRule -Action Allow
Get-NetFirewallRule -DisplayGroup "Network Discovery" | Enable-NetFirewallRule

Write-Host "Enable firewall for File Sharing" -ForegroundColor Green
Get-NetFirewallRule -DisplayGroup "File and Printer Sharing" | Set-NetFirewallRule -Action Allow 
Get-NetFirewallRule -DisplayGroup "File and Printer Sharing" | Enable-NetFirewallRule

###############################
# Git Setup
###############################
Write-BoxstarterMessage "Inatalling Git Bash"
choco install -y git -params '"/GitAndUnixToolsOnPath"'
refreshenv
# TODO: Setup .bashrc environment variables

# Copy .ssh keys from host


# TODO: pull down the Boxter git repo
if (-not (Test-Path "$home\source\repos\infra")) {
    New-Item -Path $home\source\repos -ItemType Directory
}
# (cd $home\source\repos; git clone 