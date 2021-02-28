#!/usr/bin/env pwsh
#
# 1.0
# jokobox@outlook.com
#
# This script takes multiple arguments, the first
# argument will be used as the 'file name' and the following arguments
# are appended to that file on new lines. Useful for creating or
# updating a .gitignore file.

# First string is assumed to be the file name.
$FileName = $args[0]

# Every argument after is assumed to be an individual line to be appended to the file.
$Files = $args | Select -Skip 1

# Append arguments to the file.
Add-Content -Path $FileName -Value $Files