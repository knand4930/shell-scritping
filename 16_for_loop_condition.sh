#!/bin/bash

my_array=("apple" "banana" "cherry")
length=${#my_array[*]}
for (( i=0; i<length; i++ ))
do
    echo "Element $i: ${my_array[i]}"
done