<#
General alias
#>
Set-Alias -Name gh -Value Get-Help
Set-Alias -Name so -Value Select-Object

<#
Function alias
#>
Set-Alias -Name su -Value Switch-User
Set-Alias -Name ga -Value Get-Access
Set-Alias -Name gf -Value Get-Function

# Open a new Administrator Powershell window in the current working directory.
function Switch-User 
{
    $CurrentDirectory = (Get-Location)
    Invoke-Command {Start-Process -FilePath "powershell" -Wait -Verb RunAs -ArgumentList "-NoExit", "-Command Set-Location '$CurrentDirectory'"}
}

# Display ACLs on a given path, or the current directory if no path is given.
function Get-Access 
{
    param
    (
        $Path
    )

    If (!$Path) { (Get-Acl (Get-Location)).Access } Else { (Get-Acl $Path).Access }
}

# Display the definition of a given function.
function Get-Function 
{
    param
    (
        $Target
    )

    (Get-Command $Target).definition
}