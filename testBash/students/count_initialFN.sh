#!/bin/bash
max=0
chMax='A'
for c in {A..Z}
do
    val=$(grep -c "^$c" ./LCP_22-23_students.csv)
    echo $c: $val
    if [ $val -ge $max ]
    then
        max=$val
        chMax=$c
    fi
done

echo "Maximum found in $chMax: $max"