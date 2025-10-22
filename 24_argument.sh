#!/bin/bash

echo "First Argument: $1"
echo "Second Argument: $2"
echo "All Arguments: $@"
echo "Number of Arguments: $#"
echo "Script Name: $0"

for arg in "$@"; do
    echo "Argument: $arg"
done