#Requires -RunAsAdministrator

# Make sure you run this script with elevated permissions
Set-ExecutionPolicy Unrestricted -Scope Process -Force

# Intall Boxstarter/Chocolatey
. { Invoke-WebRequest -useb https://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; Get-Boxstarter -Force

