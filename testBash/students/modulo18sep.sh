#!/bin/bash
N=$(grep "@" -c LCP_22-23_students.csv)
# li=[ $(grep "@" LCP_22-23_students.csv) ]
# for (( i=0; i<N; i++ ))
# do
#     echo $i: $li[$i]
# done
while read line
do
    echo $line
done