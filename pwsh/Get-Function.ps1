# Display function definition.

# Recommended alias:
# Set-Alias -Name gf -Value Get-Function

param(
    $Target
)

(Get-Command $Target).definition