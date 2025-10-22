#!/bin/bash

a=10

until [ $a -eq 1 ]
do
    echo "Value of a: $a"
    let a--
done