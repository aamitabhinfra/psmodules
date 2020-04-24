#Requires -RunAsAdministrator

# Reference: https://blog.frankfu.com.au/2018/03/13/enabling-network-discovery-on-windows-server/

###############################
# Elevate permissions
###############################

# Open PowerShell command with Admin priviledges
# Paste the below line in the shell and execute it
# Then run this script again
Set-ExecutionPolicy Unrestricted -Scope Process -Force

###############################
# Services requirements
###############################

# Start required services for Network Discovery on Windows
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
# Set action to allow and then enable the rule
Get-NetFirewallRule -DisplayGroup "Network Discovery" | Set-NetFirewallRule -Action Allow
Get-NetFirewallRule -DisplayGroup "Network Discovery" | Enable-NetFirewallRule

# Set action to allow and then enable the rule
Get-NetFirewallRule -DisplayGroup "File and Printer Sharing" | Set-NetFirewallRule -Action Allow 
Get-NetFirewallRule -DisplayGroup "File and Printer Sharing" | Enable-NetFirewallRule