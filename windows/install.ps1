$ProfilePath = Join-Path `
    -Path (Split-Path $MyInvocation.MyCommand.Path) `
    -ChildPath "pwsh/Microsoft.PowerShell_profile.ps1"

function Set-Link {
    New-Item -ItemType HardLink -Path $Profile -Target $ProfilePath
}

if (Test-Path $Profile) 
{
    Write-Output "A Powershell profile already exists. Overwrite profile?"
    Write-Host -NoNewLine "[Y] Yes [N] No (default is `"N`"): "

    $OverwriteCheck = Read-Host

    if ($OverwriteCheck.ToLower() -ne "Y") 
    { 
        exit
    }

    Remove-Item -Path $Profile -Force
    Set-Link
} 
else
{
    Set-Link
}

. $profile