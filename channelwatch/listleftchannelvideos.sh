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
OptionDLHtml=1
OptionWGetArgs="-q --show-progress"
OptionInputFile="channel.html"

for (( i=0; (i+1)<${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "downloadbitchute.sh { Options } [URL]"
      echo "Available Options:"
      echo "--redownload: Also include allready existing (by directory) videos for download"
      echo "--input-file: enables to specify a pre-downloaded html file name. Skips download and uses passed name to extract the video URLs"
      echo "--keep: Keep Tmp Files and Skripts"
      echo "--novid: Skip Video Download"
      echo "--wgetArgs: NExt passed String defines Args for wget [default: \"-q --show-progress\"]"
      echo "-h/--help: This Help"
      exit
    ;;
    "--input-file")
      OptionDLHtml=0
      OptionInputFile="${paramArr[i+1]}"
    ;;
    "--redownload")
      OptionRedownload=1
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

ChannelID=$(echo "${paramArr[${#paramArr[@]}-1]}" | sed 's/https:\/\/www.bitchute.com\/channel\///g' | sed 's/?showall=1//g' | sed 's/\///g')

if [ $OptionDLHtml -ge 1 ]; then
wget $OptionWGetArgs -O $OptionInputFile "https://www.bitchute.com/channel/$ChannelID/?showall=1"
fi

if [ -e "videos.txt" ]
then
  rm videos.txt
fi

Videos=$(grep '<a href="/video/' $OptionInputFile |  awk 'NF==3 {print $2}' | sed '/class/ q' | grep -v "class=" | sed 's/href="\/video\///g' | sed 's/\///g' | sed 's/"//g')

for line in $Videos
do
  if !(test -e "${line}"); then
    echo " - dl: $line"
    echo "${line}" >> videos.txt
  else
    echo "exists ${line}" 
    if [ $OptionRedownload -ge 1 ]
    then
      echo "${line}" >> videos.txt
    fi
  fi
done


