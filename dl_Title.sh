#!/bin/bash 

Title=$(grep "h1" ./index.html | sed 's/<h1 id=\"video-title\" class=\"page-title\">//g' | sed 's/<\/h1>//g')

echo $Title > Title.txt

#exit
#sed -i 's/<h1 id=\"video-title\" class=\"page-title\">//g' Title.txt
#sed -i 's/<\/h1>//g' Title.txt

