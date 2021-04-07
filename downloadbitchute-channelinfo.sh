#!/bin/bash 

#test - to parameter later
Channel=$(cat Channel.txt)

#wget $Channel
echo $Channel > tmp.txt

#cp tmp.txt tmporig.txt
sed -i 's/https:\/\/www.bitchute.com\/channel\///g' tmp.txt

sed -i 's/\r//g' tmp.txt
sed -i 's/“//g' tmp.txt
sed -i 's/\///g' tmp.txt

tmpName=$(cat tmp.txt)
echo $tmpName
rm tmp.txt

mkdir "${tmpName}"
cp dl_Chnl_*.sh "${tmpName}/"
cp videos.txt "${tmpName}/"
cd "${tmpName}"

#$tmpName

wget "https://www.bitchute.com/channel/${tmpName}/"

./dl_Chnl_Description.sh
./dl_Chnl_ChannelID.sh
./dl_Chnl_DLImage.sh

exit
rm index.html
rm ChannelID.txt
rm videos.txt
rm *.sh
