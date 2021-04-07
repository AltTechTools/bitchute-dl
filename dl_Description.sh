#!/bin/bash

Description=$(grep "<div class=\"full hidden\">" ./index.html)

echo $Description > Description.txt

sed -i 's/<div class=\"full hidden\"><p>//g' Description.txt
sed -i 's/<\/p><\/div>//g' Description.txt
sed -i 's/<br>/\r\n/g' Description.txt


