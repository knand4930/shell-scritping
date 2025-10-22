#!/bin/bash

my_array=("apple" "banana" "cherry" "date")

echo "First element: ${my_array[0]}"
echo "Second element: ${my_array[1]}"
echo "All elements: ${my_array[@]}"
echo "All elements (using *): ${my_array[*]}"
echo "Length of array: ${#my_array[*]}"
echo "Number of elements: ${#my_array[@]}"
echo "Indices of elements: ${!my_array[@]}"
echo "Slice of array (1 to 2): ${my_array[@]:2:2}"

# Loop through the array
for fruit in "${my_array[@]}"; do  
    echo "Fruit $((+1)): $fruit"
done    
# Add an element to the array

my_array+=("elderberry" 30 40)
echo "After adding an element: ${#my_array[*]}"
echo "new array of elements: ${my_array[@]}"