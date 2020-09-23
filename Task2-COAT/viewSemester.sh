#! /bin/bash

output=$1
sem=$2
year=$3

head -3 $output
cat $output | grep $sem | grep $year | sort -k 3 -n