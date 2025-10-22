#!/bin/bash

no=6

for i in 1 2 3 4 5 6 7 8 9 10
do
    if [[ $no -eq $i ]]
    then
        echo "Breaking the loop at iteration number: $i"
        break
    fi
    echo "Iteration number: $i"
done
echo "Loop ended."