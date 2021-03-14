# Mimic 'su' functionality on linux by opening a new Powershell window at the current directory with Administrator privileges.

# Recommended alias:
# Set-Alias -Name su -Value Substitute-User
    
$Set = (pwd)
$Location = $Set.Path

Invoke-Command {Start-Process -FilePath "powershell" -Wait -Verb RunAs -ArgumentList "-NoExit","-Command Set-Location '$Location'"}