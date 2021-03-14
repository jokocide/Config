# Display ACLs on a file. If called without a path, it will get the ACLs for the current directory.

# Recommended alias: 
# Set-Alias -Name su -Value ga

param(
    $Path
)

if (!$Path) {
    (Get-Acl (pwd)).Access
} else {
    (Get-Acl $Path).Access
}