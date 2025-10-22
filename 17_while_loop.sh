#!/bin/bash

count=0
num=10

while [[ $count -le $num ]]
do
    echo "Count is: $count"
    let count++
done



#!/bin/bash

FILE="/home/ubuntu/Downloads/update_org.txt"

while IFS= read -r line
do
    echo "Line: $line"
done < "$FILE"
