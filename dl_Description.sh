#!/bin/bash

Description=$(grep "<div class=\"full hidden\">" ./index.html | sed 's/<div class=\"full hidden\"><p>//g' | sed 's/<\/p><\/div>//g' | sed 's/<br>/\r\n/g')

echo $Description > Description.txt

#exit

#sed -i 's/<div class=\"full hidden\"><p>//g' Description.txt
#sed -i 's/<\/p><\/div>//g' Description.txt
#sed -i 's/<br>/\r\n/g' Description.txt


