BEGIN{
    FS=",";
    RS="\r\n";
    # OFS="\r\n";
}{
    if(NR == 1 || NR == 2){
        for(j=0;j<120;j++) printf("-");
        printf("\n");
    }
    printf("%20s%20s%20s%20s%20s%20s\n",$1,$2,$3,$5,$6,$7);
}