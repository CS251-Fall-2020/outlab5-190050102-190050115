#! /bin/bash

if (( $# != 3 ));
then 
    echo "Usage: ./realestate.sh <file1> <file2> <file3>"
    exit 1
fi

awk -F, 'BEGIN{RS="\n";}{i=$3;base=$4;tot=0;while(i--){tot=tot+(int( 0.9*base*$2 )-$6)*12;base=int( (1+$5/100)*base );}$(NF+1)=tot;}1' OFS=, $1 >temp.txt

sort -t, -nrk7 temp.txt > temp2.txt
awk -F, '{print $1,$7,$3}' OFS=, temp2.txt >$2
awk -F, '{print $1}' $2 >$3
rm temp.txt
rm temp2.txt

