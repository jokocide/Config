#!/usr/bin/env bash
#
# 1.0
# jokobox@outlook.com
#
# This script takes multiple arguments, the first
# argument will be used as the 'file name' and the following arguments
# are appended to that file on new lines. Useful for creating or
# updating a .gitignore file.

# $0 would be 'cloak.sh' so it is skipped, $1 should be the file name.
file_name=$1

# Every argument after is assumed to be an individual line to be appended to the file.
files="${@:2}"

# Append arguments to the file.
for arg in $files; do
    printf "$arg\n" >> $file_name
done