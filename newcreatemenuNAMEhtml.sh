#!/bin/bash

# loop through entries
# create files with info from each entry

while IFS= read -r line; do

    # split line

    # Set space as delimiter
    IFS=' '

    #Read the split words into an array based on comma delimiter
    read -a strarr <<< "$line"

    #Print the splitted words
    echo "User name1 : ${strarr[0]}"
    echo "User name2 : ${strarr[1]}"
    echo "ID : ${strarr[2]}"

    # use template file and write new file
    ff1=${strarr[0]}
    ff2=${strarr[1]}
    ff="menu$ff1$ff2.html"
    ff3=${strarr[2]}
   
    
    cp newtemplatefile.1 $ff
    
    sed -i 's/xxxxx/'"$ff1"'/g' $ff

    sed -i 's/yyyyy/'"$ff2"'/g' $ff

    sed -i 's/zzzzz/'"$ff3"'/g' $ff

  

done < <(xclip -o -selection clipboard)
