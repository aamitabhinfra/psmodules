# Reference: https://mcpmag.com/articles/2017/03/09/creating-a-vm-in-hyperv-using-ps.aspx
# Reference: https://www.altaro.com/hyper-v/customize-vm-powershell/

function New-AcoVM {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory=$true)]
        [Int64]$RAM = 8GB, # Gitabyter

        [Parameter(Mandatory=$true)]
        [int]$CPU = 2,

        [Parameter(Mandatory=$true)]
        [string]$ISO

    )

    # Useful code snippet
    # Get-VMHost | fl *

    $VMPath = ((Get-VMHost | Select-Object VirtualMachinePath).VirtualMachinePath) + $Name
    $VHDPath = $VMPath + "\" + $Name + ".vhdx"

    $ExternalSwitches = Get-VMSwitch -SwitchType External
    if (!($ExternalSwitches)) {
        Write-Error "ERROR: External Switch not defined.  Call Add-AcoExternalSwitch.  Aborting"
        return
    }

    New-VM -Name $Name `
        -SwitchName $ExternalSwitches.Name `
        -MemoryStartupBytes $RAM `
        -NewVHDPath $VHDPath `
        -NewVHDSizeBytes 60GB

    Set-VM -VMName $Name `
        -MemoryStartupBytes $RAM `
        -ProcessorCount $CPU `
        -StaticMemory
    
    if ($ISO) {
        Set-VMDvdDrive -VMName $Name -Path $ISO
    }

    # Start-VM -Name $Name
}

Export-ModuleMember -Function New-AcoVM