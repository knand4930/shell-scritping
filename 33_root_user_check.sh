#!/bin/bash 

# Checking if the user is root or not
if [[ $UID -eq 0 ]]; then
    echo "You are root user"
else
    echo "You are not root user"
fi
