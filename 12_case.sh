#!/bin/bash


echo "Provide Option"
echo "a) Current Date"
echo "b) Correnct Directory Listing"
echo "c) Corrent Directory Path"

read choice

case $choice in
    a)date;;
    b)ls;;
    c)pwd;;
    *)echo "Invalid option selected.";;
esac