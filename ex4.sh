#!/bin/bash

# Read input_filename, pass as a parameter
input_filename="$1"

output_file="output.txt"

# Clear output.txt to make sure it's an empty output file
>$output_file

# Input positive integer n
read -p "Nhập số n: " n

count=1

while IFS= read -r line; do
    if [ $(($count % 2)) -eq 0 ]; then
        echo "$count: $line" >>$output_file
    fi

    if [ $count -gt $n ]; then
        echo "$count: $line"
    fi

    count=$((count + 1))
done <"$input_filename"

echo "Processing complete. Check the $output_file file for results."
