#!/bin/bash

# echo "generating random $RANDOM"
# echo "generating uuid $UID"


# Generate a random UID between 1000 and 60000
RANDOM_UID=$(( RANDOM % 59001 + 1000 ))
echo "Generated Random UID: $RANDOM_UID"