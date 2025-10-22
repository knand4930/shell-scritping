#!/bin/bash

FILE="/home/ubuntu/Downloads/update_org.txt"

for line in $(cat "$FILE")
do
    echo "Line: $line"
done
