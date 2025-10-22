#!/bin/bash

# Prompt the user for a path
read -p "Enter a file or directory path: " path

# Show the basename (filename)
file_name=$(basename "$path")
echo "Basename (filename): $file_name"

# Show the dirname (directory path)
dir_name=$(dirname "$path")
echo "Dirname (directory): $dir_name"

# Show the realpath (absolute canonical path)
absolute_path=$(realpath "$path")
echo "Realpath (absolute path): $absolute_path"
