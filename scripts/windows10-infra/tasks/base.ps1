Write-BoxstarterMessage "Setting Execution Policy to Unrestricted and Disabling UAC"
Update-ExecutionPolicy Unrestricted
Disable-UAC

# Allow unattended reboots
# Write-BoxstarterMessage "Setup flags: reboot, no password, auto login"
# $Boxstarter.RebootOk=$true
# $Boxstarter.NoPassword=$false
# $Boxstarter.AutoLogin=$true

############################
# Personal Preferences on UI
############################

# WindowsExplorerOptions
Write-BoxstarterMessage "Explorer Configuration"
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -DisableShowRibbon
Disable-BingSearch
Disable-GameBarTips
# Set-TaskbarOptions -Size Small -Lock -Dock Bottom -Combine Never
Enable-RemoteDesktop

# These make "Quick Access" behave much closer to the old "Favorites"
# Disable Quick Access: Recent Files
Write-BoxstarterMessage "Folder Quick Access Setup"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 0
# Disable Quick Access: Frequent Folders
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 0

# Turn off People in Taskbar
Write-BoxstarterMessage "Turn off People in Taskbar"
If (-Not (Test-Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
    New-Item -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People | Out-Null
}
Set-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name PeopleBand -Type DWord -Value 0

# Dark Theme for Windows (commenting out by default because this one's probably a minority want)
# Note: the title bar text and such is still black with low contrast, and needs additional tweaks (it'll probably be better in a future build)
Write-BoxstarterMessage "Turn ON Dark Mode"
If (-Not (Test-Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize)) {
	New-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes -Name Personalize | Out-Null
}
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Type DWord -Value 0
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Type DWord -Value 0
# To Restore (Light Theme):
#Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Type DWord -Value 1
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Type DWord -Value 1

# Unpin Microsoft Edge from Task bar
# $appname = "Microsoft Edge"
# ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}

##################
# Privacy Settings
##################

Write-BoxstarterMessage "Privacy: Let apps use my advertising ID: Disable"
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0

Write-BoxstarterMessage "Privacy: SmartScreen Filter for Store Apps: Disable"
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost")) {
    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost -Name EnableWebContentEvaluation -Type DWord -Value 0

# Disable Telemetry (requires a reboot to take effect)
# Note this may break Insider builds for your organization
Write-BoxstarterMessage "Disable Telemetry (requires a reboot to take effect)"
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection")) {
    New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection | Out-Null
}
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
Get-Service DiagTrack,Dmwappushservice | Stop-Service | Set-Service -StartupType Disabled

Write-BoxstarterMessage "Activity Tracking: Disable"
@('EnableActivityFeed','PublishUserActivities','UploadUserActivities') |% { Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\System -Name $_ -Type DWord -Value 0 }

##################
# Microsoft junk
# From here: https://github.com/elithrar/dotfiles/blob/master/windows-boxstarter.ps1
##################
Write-BoxstarterMessage "Remove MSFT junk applications"
function removeApp {
    Param ([string]$appName)
    Write-Output "Trying to remove $appName"
    Get-AppxPackage $appName -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where DisplayNam -like $appName | Remove-AppxProvisionedPackage -Online
}
$applicationList = @(
    "Microsoft.*3D*",
    # "Microsoft.*advertising*",
    "Microsoft.Bing*",
    "Microsoft.CommsPhone",
    "Microsoft.Getstarted",
    "Microsoft.Messaging",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.Office.Sway",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.Wallet",
    "Microsoft.Windows.Photos",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsPhone",
    "Microsoft.WindowsSoundRecorder",
    "microsoft.windowscommunicationsapps",
    # "Microsoft.Xbox*",
    "Microsoft.Zune*",
    "king.com.*",
    "*disney*",
    "*MarchofEmpires*",
    "*Solitaire*"
)
foreach ($app in $applicationList) {
    removeApp $app
}

# .NET 3.5, 4.5, 4.6
# Write-BoxstarterMessage "Downloading and Installing .Net Framework v3.5 then Rebooting if needed."
# choco install DotNet3.5
# Write-BoxstarterMessage "Downloading and Installing .Net Framework v4.5 then Rebooting if needed."
# choco install DotNet4.5
# Write-BoxstarterMessage "Downloading and Installing .Net Framework v4.6 then Rebooting if needed."
# choco install DotNet4.6
# if (Test-PendingReboot) { Invoke-Reboot }

# Shortcut
Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\mstsc.exe"

Write-BoxstarterMessage "Downloading, Installing Windows Updates then rebooting if needed."
Enable-UAC
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }

# Cleanup
Write-BoxstarterMessage "Perform install cleanup."
del C:\eula*.txt
del C:\install.*
del C:\vcredist.*
del C:\vc_red.*
