#!/bin/bash

# This script prints "Hello, World!" to the console.

readonly college="S.U College"

echo "college: $college"

college="New College Name"  # This will cause an error since 'college' is readonly
echo "college: $college"