#!/bin/bash 

Title=$(grep "h1" ./index.html)

echo $Title > Title.txt
sed -i 's/<h1 id=\"video-title\" class=\"page-title\">//g' Title.txt
sed -i 's/<\/h1>//g' Title.txt

