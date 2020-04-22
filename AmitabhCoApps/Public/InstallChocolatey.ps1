function Install-Chocolatey {
    <#
    .SYNOPSIS
        You need to run this with elevated permissions
    #>
    
    # Download script
    $url = "https://chocolatey.org/install.ps1"

    if(!(test-path "$($env:ProgramData)\chocolatey\choco.exe")) {
        Write-Host "Installing Chocolatey" -ForegroundColor Green
        Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
    else {
        Write-Host "Chocolatey is already installed" -ForegroundColor Green
    }
}

Export-ModuleMember -Function Install-Chocolatey