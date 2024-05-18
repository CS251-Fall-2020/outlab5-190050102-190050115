#! /bin/bash

output=$1
substr=$2

num=$(awk '
	BEGIN{
	}NR==4{
		if($3 == "Autumn" || $3 == "Spring") print 4;
		else print 3;
	}
' "$1")

head -3 $output


cat $output | grep "$substr" | sort -k $num

