#!/bin/bash

# Check if any arguments are provided
if [[ $# -eq 0 ]]; then
    echo "No arguments provided. Please provide a number of seconds to sleep."
    exit 1
fi

# Print arguments
echo "First argument: $1"
echo "Second argument: $2"
echo "All the arguments: $@"
echo "Total number of arguments: $#"

# Sleep for the first argument (number of seconds)
sleep "$1"
echo "Slept for $1 seconds."

# For loop to access all arguments
for arg in "$@"
do
    echo "Argument: $arg"
done
