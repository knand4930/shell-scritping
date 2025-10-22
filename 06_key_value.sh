#!/bin/bash
delcare -A my_dict
my_dict=(
    ["name"]="Alice"
    ["age"]=30
    ["city"]="New York"
)


echo "Name: ${my_dict["name"]}"
echo "Age: ${my_dict["age"]}"
echo "City: ${my_dict["city"]}"     