#!/bin/bash 

SeedLinks=$(grep "<source src=\"https:\/\/" ./index.html)
#echo $SeedLinks
DownloadText=$(echo $SeedLinks | sed 's/<source src=\"//g' | sed 's/\" type=\"video\/mp4\" \/>//g')

echo $DownloadText > VidURL.txt
