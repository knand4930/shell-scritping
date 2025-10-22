#!/bin/bash

echo "-----------------------"

echo "Welcome to Function"

echo "-----------------------"


#!/bin/bash

# # Define a function
# my_function() {
#     local num=$1   # $1 is the first argument
#     echo "This is a sample function $num"
# }

# # Call the function
# my_function 1



# addition() {
#     local a=$1
#     local b=$2
#     local sum=$((a + b))
#     echo "The sum of $a and $b is: $sum"
# }   

# addition 5 10

function greeting() {
    echo "Hello, welcome to the function demo! $1"
}

greeting "User"
greeting "Admin"
