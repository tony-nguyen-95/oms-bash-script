#!/bin/bash

df_output=$(df)

echo ""List of all filesystems with less than 80% free space:""

# Skip the first line (header)
header_skipped=false

# read each line from df command
while IFS= read -r line; do
    # Skip the header line
    if [ "$header_skipped" = false ]; then
        header_skipped=true
        continue
    fi

    # split each line by spaces to an array named split_line
    IFS=' ' read -ra split_line <<<"$line"

    # assign capacity string is index 4 in array split_line
    usage_capacity_string=${split_line[4]}

    # replace percent character to empty
    usage_capacity=${usage_capacity_string%"%"}

    # compare usage capacity with number
    if [[ $usage_capacity -gt 20 ]]; then
        echo ${split_line[0]}
        echo $line
    fi
done <<<"$df_output"
