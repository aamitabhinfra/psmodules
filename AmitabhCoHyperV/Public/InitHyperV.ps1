# Define external switch name
$ExternalSwitchName = "ExternalVirtualSwitch"

function Add-ExternalSwitch {

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
            if ($ExternalSwitch.Name -eq $ExternalSwitchName) {
                Write-Host "Info: External switche AREADY exists. Done" -ForegroundColor Green
                return
            }
        }

        Write-Host "Info: External switche with different name found" -ForegroundColor Green
        Remove-ExternalSwitch $ExternalSwitch.Name
        $CreateSwitch = $true
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
    New-VMSwitch $ExternalSwitchName  -NetAdapterName $NetAdapterName -AllowManagementOS $true
}

function Remove-ExternalSwitch {
    param {
        [Parameter()]
        [string]$SwitchName
    }
    Write-Host "Removing switch $SwitchName" -ForegroundColor Green
    Remove-VMSwitch -Name $SwitchName -Force
}

function Remove-ExternalSwitchs {
    $ExternalSwitches = Get-VMSwitch -SwitchType External
    foreach($ExternalSwitch in $ExternalSwitches) {
        Remove-VMSwitch $ExternalSwitch.Name -Force
    }
}

Export-ModuleMember -Variable $ExternalSwitchName
Export-ModuleMember -Function Add-ExternalSwitch
Export-ModuleMember -Function Remove-ExternalSwitch
Export-ModuleMember -Function Remove-ExternalSwitchs