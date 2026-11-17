#!/bin/bash

echo -n "" > "data.txt"
while read -r line; do
    if [[ "$line" != "#"* ]]; then
        for ((i=0; i<${#line}; i++)); do
            c="${line:$i:1}"
            if [[ "$c" != "," ]]; then
                if [[ $i -eq ${#line}-1 ]]; then
                    echo "$c" >> "data.txt"
                else
                    echo -n "$c" >> "data.txt"
                fi
            fi
        done
    fi
done < data.csv