#!/bin/bash 
#./downloadbitchute.sh https://www.bitchute.com/video/xJNBHF80zAI/

paramArr=()

for param in "$@" 
do
    paramArr+=("${param}");
done

 
#echo "${paramArr[1]}"
#echo ${#paramArr[@]}

OptionKeep=0
OptionDLVid=1
OptionWGetArgs="-q --show-progress"

for (( i=0; (i+1)<${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "downloadbitchute.sh { Options } [URL]"
      echo "Available Options:"
      echo "--keep: Keep Tmp Files and Skripts"
      echo "--novid: Skip Video Download"
      echo "-h/--help: This Help"
      exit
    ;;
    "--keep")
      OptionKeep=1
      echo "k param"
      echo "${paramArr[i+1]}"
   ;;
   "--novid")
     OptionDLVid=0
   ;;
    *)
      #echo "else"
      #echo "${paramArr[i]}"
    ;;
  esac
  #echo "${paramArr[i]}"
  #echo "${paramArr[${#paramArr[@]}-1]}"
done

Test=${paramArr[${#paramArr[@]}-1]}

echo "Keep: $OptionKeep"
if [ $OptionKeep -lt 1 ]
then 
echo "do not keep"
fi
echo "Test: $Test"
#exit

if [ "$Test" = '' ]
then
echo "No URL specified"
exit
fi

##echo "https://www.bitchute.com/video/xJNBHF80zAI/" > tmp.txt
#sed -i 's/https:\/\/www.bitchute.com\/video//g' tmp.txt
#sed -i 's/?list=subscriptions//g' tmp.txt
#sed -i 's/\///g' tmp.txt
URL="https://www.bitchute.com/video/"
VideoID=$(echo "${Test}" | sed 's/https:\/\/www.bitchute.com\/video//g' | sed 's/?list=subscriptions//g' | sed 's/\///g')
#VideoID=$(cat tmp.txt)

URL="${URL}${VideoID}/"
#exit
#if [ $OptionKeep -lt 1 ]
#then 
#rm tmp.txt
#fi

#echo $URL

#wget https://www.bitchute.com/video/xJNBHF80zAI/
mkdir $VideoID
cp dl_*.sh "${VideoID}/"
cp downloadbitchute-channelinfo.sh "${VideoID}/"
cd $VideoID
echo $VideoID > videos.txt
tmp=$(wget $OptionWGetArgs $URL)
#tmp=$(wget $OptionWGetArgs $URL)


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
#echo "download chanel info"
./downloadbitchute-channelinfo.sh
#DownloadText=$(cat tmp.txt)
DownloadText=$(cat VidURL.txt)
Channel=$(cat Channel.txt)
Title=$(cat Title.txt)
Description=$(cat Description.txt)

#download actual video
if [ $OptionDLVid -ge 1 ]
then 
#tmpclear
echo "Downloading Video File"
tmp=$(wget $OptionWGetArgs $DownloadText)
fi

#rm tmp.txt
#exit
if [ $OptionKeep -lt 1 ]
then 
rm videos.txt
rm VidURL.txt
rm index.html
rm downloadbitchute-channelinfo.sh
rm dl_*.sh
fi
#echo $DownloadText

#tmp=$(wget $DownloadText)
#clear
echo "Done"
