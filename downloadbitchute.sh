#!/bin/bash 

paramArr=()

for param in "$@" 
do
    paramArr+=("${param}");
done

OptionKeep=0
OptionDLVid=1
#OptionWGetArgs="-q --show-progress"
OptionWGetArgs="-q"

for (( i=0; (i+1)<${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "downloadbitchute.sh { Options } [URL]"
      echo "Available Options:"
      echo "--keep: Keep Tmp Files and Skripts"
      echo "--novid: Skip Video Download"
      echo "--wgetArgs: NExt passed String defines Args for wget [default: \"-q --show-progress\"]"
      echo "-h/--help: This Help"
      exit
    ;;
    "--keep")
      OptionKeep=1
      #echo "k param"
      #echo "${paramArr[i+1]}"
   ;;
   "--wgetArgs")
     OptionWGetArgs="${paramArr[i+1]}"
   ;;

   "--novid")
     OptionDLVid=0
   ;;
  esac
done

Test=${paramArr[${#paramArr[@]}-1]}

if [ "$Test" = '' ]
then
  echo "No URL specified"
  exit
fi

URL="https://www.bitchute.com/video/"
VideoID=$(echo "${Test}" | sed 's/https:\/\/www.bitchute.com\/video//g' | sed 's/?list=subscriptions//g' | sed 's/\///g')

URL="${URL}${VideoID}/"

echo "${VideoID}"
#exit
mkdir -- "${VideoID}/" || { echo "mkdir failed! exiting & skipping this Download ${VideoID}"; exit; }
[ $(ls | grep -c "\.sh") -lt 14 ] && cp skrptbak/* .
cp -- dl_*.sh "${VideoID}/"
cp -- downloadbitchute-channelinfo.sh "${VideoID}/"
cd -- "${VideoID}" || { echo "cd failed! exiting & skipping this Download ${VideoID}"; exit; }
echo "${VideoID}" > videos.txt
#echo $URL
#echo "$OptionWGetArgs ; $URL"
tmp=$(wget "$OptionWGetArgs" "$URL")
#echo $tmp
#exit
./dl_DownloadText.sh
./dl_Channel.sh
./dl_Title.sh
./dl_Description.sh
./downloadbitchute-channelinfo.sh

DownloadText=$(cat VidURL.txt)
Channel=$(cat Channel.txt)
Title=$(cat Title.txt)
Description=$(cat Description.txt)

#download actual video
if [ $OptionDLVid -ge 1 ]
then
  echo "Downloading Video File"
  tmp=$(wget "$OptionWGetArgs" "$DownloadText")
fi

if [ $OptionKeep -lt 1 ]
then 
  rm -f videos.txt
  rm -f VidURL.txt
  rm -f index.html
  rm -f downloadbitchute-channelinfo.sh
  rm -f dl_*.sh
fi
echo "Done"
