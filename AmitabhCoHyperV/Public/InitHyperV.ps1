# Define external switch name
$ExternalSwitchName = "ExternalVirtualSwitch"

function Add-ExternalSwitch {

    # If the switch does not exists then create it
    $ExternalSwitches = Get-VMSwitch -SwitchType External
    if ($null -eq $ExternalSwitches) {
    
        # Identify the physical Network adapter
        $NetAdapter = Get-NetAdapter -Physical
        if ($null -eq $NetAdapter) {
            Write-Error "No Physical Network Adapter Found...Aborting"
            return $false
        }

        # Check if external switch is already created
        

        # Create a new External Switch
        New-VMSwitch -name $ExternalSwitchName  -NetAdapterName $NetAdapter -AllowManagementOS $true
    }

    # If the switch is already created and if it is not with the same name
    # then delete it and re-create it or try to rename it
    else {
    
    }
}

function Remove-ExternalSwitch {
    Remove-VMSwitch $ExternalSwitches -Force
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