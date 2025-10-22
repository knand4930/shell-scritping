#!/bin/bash

FILE="/home/ubuntu/Downloads/update_org.txt"

while IFS= read -r line
do
    echo "Line: $line"
done < "$FILE"
