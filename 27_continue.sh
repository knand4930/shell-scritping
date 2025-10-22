#!/bin/bash

for i in 1 2 3 4 5 6 7 8 9 10
do
    let r=$i%2
    if [[ $r -eq 0 ]]
    then
        echo "Skipping even iteration number: $i"
        continue
    fi
    echo "Odd iteration number: $i"
done
echo "Loop ended."