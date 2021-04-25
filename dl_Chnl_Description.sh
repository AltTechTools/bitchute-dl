#!/bin/bash 

grep -A 999 "<div id=\"channel-description\"" index.html | grep -B 999 -m 1 "<\/div>" | grep -v "<\/div>" | grep -v "<div id=\"channel-description\" " | sed 's/<br>/\r\n/g' > Description.txt
