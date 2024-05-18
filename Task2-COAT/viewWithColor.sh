#! /bin/bash

file=$2
output=$1
source ./resources/defineColors.sh



awk -v BLACK_FONT="$BLACK_FONT" -v RED_FONT="$RED_FONT" -v GREEN_FONT="$GREEN_FONT" -v YELLOW_FONT="$YELLOW_FONT" -v BLUE_FONT="$BLUE_FONT" -v MAGENTA_FONT="$MAGENTA_FONT" -v CYAN_FONT="$CYAN_FONT" -v WHITE_FONT="$WHITE_FONT" -v BLACK_BACKGROUND="$BLACK_BACKGROUND" -v RED_BACKGROUND="$RED_BACKGROUND" -v GREEN_BACKGROUND="$GREEN_BACKGROUND" -v YELLOW_BACKGROUND="$YELLOW_BACKGROUND" -v BLUE_BACKGROUND="$BLUE_BACKGROUND" -v MAGENTA_BACKGROUND="$MAGENTA_BACKGROUND" -v CYAN_BACKGROUND="$CYAN_BACKGROUND" -v WHITE_BACKGROUND="$WHITE_BACKGROUND" -v RESET_ALL="$RESET_ALL" '
    BEGIN{
        FS=",";
        RS="\n";
        color["BLACK_FONT"] = BLACK_FONT
        color["RED_FONT"] = RED_FONT
        color["GREEN_FONT"] = GREEN_FONT
        color["YELLOW_FONT"] = YELLOW_FONT
        color["BLUE_FONT"] = BLUE_FONT
        color["MAGENTA_FONT"] = MAGENTA_FONT
        color["CYAN_FONT"] = CYAN_FONT
        color["WHITE_FONT"] = WHITE_FONT
        color["BLACK_BACKGROUND"] = BLACK_BACKGROUND
        color["RED_BACKGROUND"] = RED_BACKGROUND
        color["GREEN_BACKGROUND"] = GREEN_BACKGROUND
        color["YELLOW_BACKGROUND"] = YELLOW_BACKGROUND
        color["BLUE_BACKGROUND"] = BLUE_BACKGROUND
        color["MAGENTA_BACKGROUND"] = MAGENTA_BACKGROUND
        color["CYAN_BACKGROUND"] = CYAN_BACKGROUND
        color["WHITE_BACKGROUND"] = WHITE_BACKGROUND
    }
    FNR==NR{
        if(NR>1){
            course = $1;
            gsub(" ", "", course);
            color1 = color[$3 "_FONT"];
            color2 = color[$4 "_BACKGROUND"];
            arr1[course] = color1;
            arr2[course] = color2;
        }
    }FNR!=NR{
        if(FNR<=3){
            print $0
        }
        if(FNR>3){
            a = substr($0,82,20);
            gsub(" ", "", a);
            text = arr1[a""];
            back = arr2[a""];
            printf("%s%s%s%s\n", back, text, $0, RESET_ALL)
        }
    }
' "$file" "$output"
