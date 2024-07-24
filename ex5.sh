#!/bin/bash

output_file="final_ex5.txt"
# Clear output_file to make it an empty file
>$output_file

# Input filenames array
file_names=("pre_a_exp5.txt" "pre_b_exp5.txt" "pre_c_exp5.txt")

# Global arrays
total_fail=0
total_pass=0
total_notcheck=0
totals=()

# Read each file
for file_name in "${file_names[@]}"; do
    count=0
    total=0

    # Read each line of the file
    while IFS= read -r line; do
        value=${line#*: }

        if [[ $count -eq 0 ]]; then
            total_fail=$(($total_fail + $value))
        elif [[ $count -eq 1 ]]; then
            total_pass=$(($total_pass + $value))
        elif [[ $count -eq 2 ]]; then
            total_notcheck=$(($total_notcheck + $value))
        fi

        total=$(($total + $value))
        count=$(($count + 1))
    done <"$file_name"

    # Push total each file
    totals+=($total)
done

# Write output
echo "FAIL: $total_fail" >>$output_file
echo "PASS: $total_pass" >>$output_file
echo "NOTCHECK: $total_notcheck" >>$output_file

echo "*****" >>$output_file

echo "SUM1: ${totals[0]}" >>$output_file
echo "SUM2: ${totals[1]}" >>$output_file
echo "SUM3: ${totals[2]}" >>$output_file

echo "Processing complete. Check the $output_file file for results."
