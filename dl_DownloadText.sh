#!/bin/bash 

DownloadText=$(grep "<source src=\"https:\/\/seed" ./index.html | sed 's/<source src=\"//g' | sed 's/\" type=\"video\/mp4\" \/>//g')

echo $DownloadText > VidURL.txt
