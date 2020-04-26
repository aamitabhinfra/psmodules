function New-AcoVM {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$VMName,

        [Parameter(Mandatory=$false)]
        [string]$RAM = 8GB,

        [Parameter(Mandatory=$false)]
        [int]$CPU = 2,

        [Parameter(Mandatory=$false)]
        [string]$ISO

    )

    # Useful code snippet
    # Get-VMHost | fl *

    $VMPath = ((Get-VMHost | Select-Object VirtualMachinePath).VirtualMachinePath) + $VMName
    $VHDPath = $VMPath + "\" + $VMName + ".vhdx"

    $ExternalSwitches = Get-VMSwitch -SwitchType External
    if (!($ExternalSwitches)) {
        Write-Error "ERROR: External Switch not defined.  Call Add-AcoExternalSwitch.  Aborting"
        return
    }

    New-VM -Name $VMName `
        -SwitchName $ExternalSwitches.Name `
        -MemoryStartupBytes $RAM `
        -NewVHDPath $VHDPath `
        -NewVHDSizeBytes 60GB

    Set-VM -VMName $VMName `
        -MemoryStartupBytes $RAM `
        -ProcessorCount $CPU `
        -StaticMemory
    
    if ($ISO) {
        Set-VMDvdDrive -VMName $VMName -Path $ISO
    }

    # Start-VM -Name $VMName
}

Export-ModuleMember -Function New-AcoVM