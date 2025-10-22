#!/bin/bash

file="/home/ubuntu/Downloads/dashboard_user_contacts (10).csv"

while IFS=, read -r Email Company Phone Whatsapp Designation Country CreationDate LastUpdateDate
do
    echo "Email: $Email"
    echo "Company: $Company"
    echo "Phone: $Phone"
    echo "Whatsapp: $Whatsapp"
    echo "Designation: $Designation"
    echo "Country: $Country"
    echo "Creation Date: $CreationDate"
    echo "Last Update Date: $LastUpdateDate"
    echo "-----------------------------"
done < "$file"


# cat "/home/ubuntu/Downloads/dashboard_user_contacts (10).csv" | awk 'NR!=1 {print}'
