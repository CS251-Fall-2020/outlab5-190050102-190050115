#! /bin/bash

courses=$1
grades=$2

awk 'BEGIN{FS=",";RS="\r\n";OFS="\r\n";} NR >1{print $5,$7}' OFS=, $courses >temp
awk 'BEGIN{FS=",";RS="\r\n";OFS="\r\n";} NR >1{print $1,$2}' OFS=, $grades >temp2

awk -F, '
	BEGIN {
		s=0;
		cr=0;
	}
	(NR==FNR){
		if(!($2 in na)){na[$2]=0;}
		na[$2]+=$1;
		next;
	}

	{
		if($1 in na){
			s+=na[$1]*$2
		}
		
	}
	END{
		for(i in na){
			cr+=na[i]
		}
		printf "%0.4f\n",s/cr
	}' temp temp2

rm temp
rm temp2


