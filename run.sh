#!/bin/bash

#date=$(date '+%Y-%m-%d')
date="2019-08-16"
symbol="/tmp/symbol-orig"
temp="/tmp/day"
output="$date.txt"

echo "Generating symbol list..."
#~/market/symbol.py | tail -n +2 | awk 'BEGIN {FS=","}; {print $1}' > $symbol

count=`cat $symbol | wc -l`
echo "Fetching daily prices of $count symbols..."
~/market/day.py -s $symbol -o $temp

cat $temp | grep $date | awk 'BEGIN {FS=","}; {OFS="\t"}; {print $2,$3,$4,$5,$6,$7}' | sort > $output
lines=`cat $output | wc -l`
echo "$lines prices wrote to $output"