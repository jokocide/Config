# Most of these aliases reference functions that have longer, more verbose names below. this is so they resemble native cmdlets, even though 
# they are not all have 'legal' verbs according to Microsoft.
Set-Alias -Name gh -Value Get-Help

# Powershell is verbose. Make a ton of aliases if you value sanity.
Set-Alias -Name editor -Value $Editor
Set-Alias -Name ga -Value Get-Access
Set-Alias -Name ep -Value Edit-Profile
Set-Alias -Name su -Value Substitute-User
Set-Alias -Name opd -Value Open-ProfileDirectory
Set-Alias -Name gf -Value Get-Function

# Mimic the 'EDITOR' environment variable on unix systems. Change this to call whatever editor you prefer.
$Editor = "code-insiders"

function Substitute-User {
    # Mimic 'su' functionality on linux by opening a new Powershell window at the current directory with Administrator privileges.
    $Set = (pwd)
    $Location = $Set.Path

    Invoke-Command {Start-Process -FilePath "powershell" -Wait -Verb RunAs -ArgumentList "-NoExit","-Command Set-Location '$Location'"}
}

function Get-Access {
    # Display ACLs on a file. If called without a path, it will get the ACLs for the current directory.
    param(
        $Path
    )
    
    if (!$Path) {
        (Get-Acl (pwd)).Access
    } else {
        (Get-Acl $Path).Access
    }
}

function Edit-Profile {
    # Open current Powershell profile in VSC Insiders.
    # Provide an $Editor variable if you are using this script on its own.
    $Editor $Profile
}

function Open-ProfileDirectory {
    # Move to Powershell directory. Use -gui argument to open in explorer.
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
   
}

function Get-Function {
    # Display function definition.
    param(
        $Target
    )

    (Get-Command $Target).definition
}