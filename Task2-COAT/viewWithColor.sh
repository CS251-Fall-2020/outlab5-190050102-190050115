#! /bin/bash

output=$1;
# creditColor=$2;
source ./resources/defineColors.sh;
# colors=();

# awk -v b=$colors -F, '
#     BEGIN{
#         FS=",";
#         RS="\n";
#     }{
#         if(NR>1){
#             b[length(b)+1]=$0;
#         }
#     }END{
#         for(i=1; i<=length(b); i++) print b[i];
#     }
# ' "$creditColor"

awk -F, '
    BEGIN{
        RS="\n";
    }{
        reset = "\033[0m"
        if(NR>3){
            a = substr($0,82,20);
            gsub(" ", "", a);
            print a;
            color = "\033[34m";
            print(color, $0, reset)
        }
    }

' "$output"

# echo "${colors[@]}";
