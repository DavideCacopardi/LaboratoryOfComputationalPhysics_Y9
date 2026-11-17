#!/bin/bash

echo -n "" > farData.csv
echo -n "" > nearData.csv
c=$( echo "10000*3/4" | bc )
while read -r line; do
    if [[ "$line" != "#"* ]]; then
        entries=0
        sum=0
        for word in $line; do
            if [[ ${word:${#word}-1:1} == "," ]]; then
                word=${word:0:${#word}-1}
            fi
            sum=$(( $word * $word ))
            ((entries++))
            if [ $entries -ge 3 ]; then
                break
            fi
        done
        if [[ $sum -ge $c ]]; then
            echo $line >> farData.csv
        else
            echo $line >> nearData.csv
        fi
    fi
done < data.csv
