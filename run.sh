#!/bin/bash

DATE=${1:-`date +%Y-%m-%d`}
DIR=$HOME/market

######################
# Symbols
######################
SYMBOLS=$(mktemp /tmp/symbols.XXXX)
$DIR/symbol.py > $SYMBOLS
wc -l $SYMBOLS | ~/bin/telegram > /dev/null

######################
# Day
######################
TEMP=$(mktemp /tmp/day.XXXX)
cat $SYMBOLS | parallel --jobs 30 -N100 --pipe $DIR/day.py -d $DATE -f - > $TEMP
mkdir -p $DIR/data/day
sort $TEMP > $DIR/data/day/$DATE.txt
wc -l $DIR/data/day/$DATE.txt | ~/bin/telegram > /dev/null

######################
# Minute
######################
TEMP=$(mktemp /tmp/minute.XXXX)
cat $SYMBOLS | parallel --jobs 30 -N100 --pipe $DIR/minute.py -d $DATE -f - > $TEMP
mkdir -p $DIR/data/minute
sort -k4 $TEMP > $DIR/data/minute/$DATE.txt
wc -l $DIR/data/minute/$DATE.txt | ~/bin/telegram > /dev/null
