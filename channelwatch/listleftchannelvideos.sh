#!/bin/bash


#for now gets the recommended videos on the right side, instead of the main list
paramArr=()

for param in "$@" 
do
    paramArr+=("${param}");
done

#also for e.v called dl skript
OptionRedownload=0
OptionKeep=0
OptionDLVid=1
OptionWGetArgs="-q --show-progress"

for (( i=0; (i+1)<${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "downloadbitchute.sh { Options } [URL]"
      echo "Available Options:"
      echo "--redownload: Also include allready existing (by directory) videos for download"
      echo "--keep: Keep Tmp Files and Skripts"
      echo "--novid: Skip Video Download"
      echo "--wgetArgs: NExt passed String defines Args for wget [default: \"-q --show-progress\"]"
      echo "-h/--help: This Help"
      exit
    ;;
    "--redownload")
      OptionRedownload=1
      #echo " OptionRedownload"
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
    *)
      #echo "else"
      #echo "${paramArr[i]}"
    ;;
  esac
  #echo "${paramArr[i]}"
  #echo "${paramArr[${#paramArr[@]}-1]}"
done

ChannelID=$(echo "${paramArr[${#paramArr[@]}-1]}" | sed 's/https:\/\/www.bitchute.com\/channel\///g' | sed 's/?showall=1//g' | sed 's/\///g')
#echo "$ChannelID"
#exit

#-> specify output file
#-> use showall url
wget $OptionWGetArgs -O channel.html "https://www.bitchute.com/channel/$ChannelID/?showall=1"

if [ -e "videos.txt" ]
then
  #echo "rm vidoes"
  rm videos.txt
fi

#grep "<a href=\"/video/" test.html
#Videos=$(grep "<p class=\"video-card-title\"><a href=\"/video/" channel.html | awk '{print $3}' | grep "href=\"/" | sed 's/href=\"\/video\///g' | sed 's/\/\"//g')
Videos=$(grep '<a href="/video/' channel.html | awk '{print $2}' | sed '/class/ q' | grep -v "class=" | sed 's/href="\/video\///g' | sed 's/\///g' | sed 's/"//g')

#echo "Vidoes: $Videos"
#<p class="video-card-title"><a href="/video/

#sed -i 's/\" class=\"spa\">/\r\n/g' videos.txt
#cp videos.txt videos2.txt
#grep "<p class=\"video-card-title\"><a href=\"/video/" videos2.txt > videos.txt

#exit
#sed -i 's/ /\r\n/g' videos.txt
#cp videos.txt videos2.txt
#grep "href=\"/" videos2.txt > videos.txt
#sed -i 's/href=\"\/video\///g' videos.txt
#sed -i 's/\/\"//g' videos.txt

#rm videos2.txt
#while IFS= read -r line; do
for line in $Videos
do
#echo "line: $line"
if !(test -e "${line}"); then
  echo " - dl: $line"
  echo "${line}" >> videos.txt
  #echo "not found ${line}"
  #mkdir "${line}"
else
  echo "exists ${line}" 
  if [ $OptionRedownload -ge 1 ]
  then
    #echo "OptionRedownload in action"
    echo "${line}" >> videos.txt
  fi
fi
done
#done < videos.txt


