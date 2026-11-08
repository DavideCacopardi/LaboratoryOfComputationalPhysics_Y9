#!/bin/bash

for ((i=0; i<18; i++)); do
    rm "stMod18_m$i.csv" 2>> err.txt
done
counter=0
while read -r line; do
    if [[ "$line" == *"@"* ]]; then
    # if [ "${line:0:1}" != "F" ]; then
        mod=$((counter % 18))
        echo "$(($counter+1)): $line" >> "stMod18_m$mod.csv"
        # 2. Append $line to your dynamically named file
        ((counter++))
    fi
done < LCP_22-23_students.csv