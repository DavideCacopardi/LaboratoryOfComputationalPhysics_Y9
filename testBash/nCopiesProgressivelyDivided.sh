#!/bin/bash

# checking if the user provided an input
if [ -z $1 ]
then
    echo "this script requires as input the name of the file to be created"
    exit
fi

mkdir nCopies
for (( i=1; $i<=$1; i++ )); do
    outfile="./nCopies/dataDiv$i.csv"
    echo "### data.csv divided by $i ###" > "$outfile"
    while read -r line; do
        if [[ "$line" != "#"* ]]; then
            for word in $line; do
                if [[ ${word:${#word}-1:1} == "," ]]; then
                    num=${word:0:${#word}-1}
                    trail=", "
                else
                    num=$word
                    trail=" "
                fi
                num=$( echo "scale=3;$num/$i" | bc )
                echo -n "$num$trail" >> "$outfile"
            done
            echo "" >> "$outfile"
        else
            echo "$line" >> "$outfile"
        fi
        
    done < data.csv
done