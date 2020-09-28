#! /bin/bash

output=$1
substr=$2

head -3 $output
# cat $output | grep "$substr" | sort -k 3
cat $output | grep "$substr" | sort -k 4