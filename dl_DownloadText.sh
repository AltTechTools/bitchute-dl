#!/bin/bash 

DownloadText=$(grep "<source src=\"https:\/\/seed" ./index.html | sed 's/<source src=\"//g' | sed 's/\" type=\"video\/mp4\" \/>//g')

echo $DownloadText > VidURL.txt


#sed -i 's/<source src=\"//g' VidURL.txt
#sed -i 's/\" type=\"video\/mp4\" \/>//g' VidURL.txt

#DownloadText=$(cat tmp.txt)
#rm tmp.txt
#echo $DownloadText

