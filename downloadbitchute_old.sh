#!/bin/bash 

echo "https://www.bitchute.com/video/xJNBHF80zAI/" > tmp.txt
sed -i 's/https:\/\/www.bitchute.com\/video//g' tmp.txt
sed -i 's/\///g' tmp.txt
URL="https://www.bitchute.com/video/"
VideoID=$(cat tmp.txt)
URL="${URL}${VideoID}/"
rm tmp.txt

#echo $URL

#wget https://www.bitchute.com/video/xJNBHF80zAI/
mkdir $VideoID
cd $VideoID
tmp=$(wget $URL)

Title=$(grep "h1" ./index.html)
DownloadText=$(grep "<source src=\"https:\/\/seed" ./index.html)
Description=$(grep "<div class=\"full hidden\">" ./index.html)
Channel=$(grep "<p class=\"video-card-channel\">" index.html)
#only referedVideoThumb=$(grep "<img class=\"img-responsive lazyload\"" index.html)
#find video thumb:
#1. extract chanel url
#2. download html
#3. grep xJNBHF80zAI_ ("${VideoID}_")
# 4. download contained link

echo $Title > Title.txt
#echo $VideoThumb > thumb.txt
echo $Channel > Channel.txt
echo $Description > Description.txt
echo $DownloadText > tmp.txt
#DownloadText=$(sed -i 's/<source src=\"/\" type=\"video\/mp4\" \/>/g' tmp.txt)
sed -i 's/<source src=\"//g' tmp.txt
sed -i 's/\" type=\"video\/mp4\" \/>//g' tmp.txt
#sed -i 's/ /\r\n/g' thumb.txt
sed -i 's/<p class=\"video-card-channel\"><a href=\"\///g' Channel.txt
sed -i 's/\" class=\"spa\">/\r\n/g' Channel.txt
grep "channel" Channel.txt > Channel.txt

#ThumbURLS=$(grep "data-src=" thumb.txt)
#echo $ThumbURLS > thumb2.txt
DownloadText=$(cat tmp.txt)
rm tmp.txt
#echo $DownloadText

tmp=$(wget $DownloadText)
echo "Done"
