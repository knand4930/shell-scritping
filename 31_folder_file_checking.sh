#!/bin/bash

FILEPATH="/home/ubuntu/bash_script/file.txt"

# Check if file exists
if [ -f "$FILEPATH" ]; then
    echo "File exists."
else
    echo "File does not exist."
    touch "$FILEPATH"
    echo "File created."
fi

# Check if folder exists
FOLDER="/home/ubuntu/bash_script/folder"
if [ -d "$FOLDER" ]; then
    echo "Folder exists."
else
    echo "Folder does not exist."
    mkdir -p "$FOLDER"
    echo "Folder created."
fi
