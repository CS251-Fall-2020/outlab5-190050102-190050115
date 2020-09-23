#!/bin/bash

source ./resources/defineColors.sh;

# outputA=$1;
credit=$2;

function addColor {
    # line=$1
    line="                2019              Autumn              ET 606                   4 Additional Learning                  AA" 
    # echo "$RED_FONT $line $RESET_ALL";
    case $line in
        *"Additional Learning"*)
        echo "It's there."
        ;;        
    esac
}

# addColor

awk -F, 'BEGIN{FS=","}
            BEGIN{ i=0; 
                while(getline!=0) {
                    if(i!=0){
                        printf("%s=%s\n%s2=%s\n", $1, $3, $1, $4);
                    } 
                    ++i
                }
            }' "$credit" > temp
sed -i 's/ /_/g' temp

awk -F, '
    BEGIN{FS=" ;..}
'


# source temp
# echo $Minor
# awk -F, 'BEGIN{OFS=","} {printf($0); printf("\n")}' "$credit"

# while IFS= read -r line; do
#     echo "$line"
# done < <(grep "" $outputA)