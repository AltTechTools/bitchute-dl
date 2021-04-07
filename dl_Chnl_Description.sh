#!/bin/bash 
grep "<div id=\"channel-description\"" index.html

grep -A 999 "<div id=\"channel-description\"" index.html > tmp.txt
grep -B 999 -m 1 "<\/div>" tmp.txt > tmp2.txt
grep -v "<\/div>" tmp2.txt > tmp.txt
grep -v "<div id=\"channel-description\" " tmp.txt > Description.txt
sed -i 's/<br>/\r\n/g' Description.txt
rm tmp*.txt


