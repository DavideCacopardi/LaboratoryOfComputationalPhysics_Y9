#!/bin/bash

count=0
while read -r line; do
    if [[ $line != "#"* ]]; then
        for word in $line; do
            # remove the final comma
            if [ ${word:${#word}-1:1} == "," ]; then
                word=${word:0:${#word}-1}
            fi
            
            if [ $(($word%2)) -eq 0 ]; then
                # echo $word
                ((count++))
            fi
        done
    fi
done
echo $count