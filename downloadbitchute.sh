#!/bin/bash 
#./downloadbitchute.sh https://www.bitchute.com/video/xJNBHF80zAI/

for param in "$@" 
do
    Test="${param}";
done

if [ "$Test" = '' ]
then
echo "No URL specified"
exit
else
echo "${Test}"  > tmp.txt
fi
#gedit tmp.txt

#echo "https://www.bitchute.com/video/xJNBHF80zAI/" > tmp.txt
sed -i 's/https:\/\/www.bitchute.com\/video//g' tmp.txt
sed -i 's/?list=subscriptions//g' tmp.txt
sed -i 's/\///g' tmp.txt
URL="https://www.bitchute.com/video/"
VideoID=$(cat tmp.txt)
URL="${URL}${VideoID}/"
#exit
rm tmp.txt

#echo $URL

#wget https://www.bitchute.com/video/xJNBHF80zAI/
mkdir $VideoID
cp dl_*.sh "${VideoID}/"
cp downloadbitchute-channelinfo.sh "${VideoID}/"
cd $VideoID
echo $VideoID > videos.txt
tmp=$(wget $URL)


#only referedVideoThumb=$(grep "<img class=\"img-responsive lazyload\"" index.html)
#find video thumb:
#1. extract chanel url
#2. download html
#3. grep xJNBHF80zAI_ ("${VideoID}_")
# 4. download contained link


#echo $VideoThumb > thumb.txt

#sed -i 's/ /\r\n/g' thumb.txt
#sed -i 's/<br>/\r\n/g' Description.txt
#sed -i 's/from/to/g' Description.txt

#ThumbURLS=$(grep "data-src=" thumb.txt)
#echo $ThumbURLS > thumb2.txt
#exit
./dl_DownloadText.sh
./dl_Channel.sh
./dl_Title.sh
./dl_Description.sh
#exit
./downloadbitchute-channelinfo.sh
#DownloadText=$(cat tmp.txt)
DownloadText=$(cat VidURL.txt)
Channel=$(cat Channel.txt)
Title=$(cat Title.txt)
Description=$(cat Description.txt)
#rm tmp.txt
#exit
rm videos.txt
rm VidURL.txt
rm index.html
rm downloadbitchute-channelinfo.sh
rm dl_*.sh
#echo $DownloadText

tmp=$(wget $DownloadText)
clear
echo "Done"
