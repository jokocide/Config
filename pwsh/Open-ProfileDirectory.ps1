# Move to Powershell directory. Use the -gui argument to open in File Explorer.

# Recommended alias:
# Set-Alias -Name opd -Value Open-ProfileDirectory

$Path = "$home\Documents\WindowsPowershell"

if ($Args) {
    foreach ($Arg in $Args) {
        if ($Arg -eq "-GUI") {
            explorer $Path 
        } elseif ($Arg -ne "-GUI") {
            Write-Host "-GUI is the only supported argument right now."
        }
    }
}
Set-Location $Path  