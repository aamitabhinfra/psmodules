# Define external switch name
$AcoExternalSwitchName = "External Virtual Switch"

function Add-AcoExternalSwitch {

    # Detect if switch does not pre-exist
    $ExternalSwitches = Get-VMSwitch -SwitchType External
    $CreateSwitch = $false
    if ($null -eq $ExternalSwitches) {
        Write-Host "Info: No pre-existing External switch detected"
        $CreateSwitch = $true
    }

    # More than 1 external switch is not supported at this time by this script
    # Only one physical ethernet adapter is considered to exist
    # And in Hyper-V only one external switch can exist for one physical ethernet adapter
    elseif (($ExternalSwitches).Count -gt 1) {
        Write-Host "More than one external switch not suppoted" -ForegroundColor Red
        Write-Host "Expecting to only have 1 Physical Ethernet Adapter in the machine" -ForegroundColor Red
        return
    }

    # Check if switch exist with the same name
    else {
        foreach ($ExternalSwitch in $ExternalSwitches) {
            if ($ExternalSwitch.Name -eq $AcoExternalSwitchName) {
                Write-Host "Info: External switche AREADY exists. Done" -ForegroundColor Green
                return
            }
        }

        Write-Host "Info: Renaming External Switch from '$($ExternalSwitch.Name)' to '$AcoExternalSwitchName'" -ForegroundColor Green
        Rename-VMSwitch $ExternalSwitch.Name -NewName $AcoExternalSwitchName
        return
    }

    # If there is no need to create external switch then done
    if (!($CreateSwitch)) {
        return
    }

    # Identify the physical Network adapter
    $NetAdapter = Get-NetAdapter -Physical
    if ($null -eq $NetAdapter) {
        Write-Error "No Physical Network Adapter Found...Aborting"
        return $false
    }

    # Create a new External Switch
    $NetAdapterName = $NetAdapter.Name
    New-VMSwitch $AcoExternalSwitchName  -NetAdapterName $NetAdapterName -AllowManagementOS $true
}

function Remove-AcoExternalSwitch {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$SwitchName
    )
    Write-Host "Removing switch $SwitchName" -ForegroundColor Green
    Remove-VMSwitch -Name $SwitchName -Force
}

function Remove-AcoExternalSwitchs {
    $ExternalSwitches = Get-VMSwitch -SwitchType External
    foreach($ExternalSwitch in $ExternalSwitches) {
        Remove-VMSwitch $ExternalSwitch.Name -Force
    }
}

Export-ModuleMember -Variable $AcoExternalSwitchName
Export-ModuleMember -Function Add-AcoExternalSwitch
Export-ModuleMember -Function Remove-AcoExternalSwitch
Export-ModuleMember -Function Remove-AcoExternalSwitchs