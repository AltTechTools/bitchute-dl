#!/bin/bash

ChannelID=$(cat ChannelID.txt)

paramArr=()

for param in "$@" 
do
    paramArr+=("${param}");
done

OptionWGetArgs="-q --show-progress"

for (( i=0; i<${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "downloadbitchute.sh { Options } [URL]"
      echo "Available Options:"
      echo "--wgetArgs: NExt passed String defines Args for wget [default: \"-q --show-progress\"]"
      echo "-h/--help: This Help"
      exit
    ;;
   "--wgetArgs")
     OptionWGetArgs="${paramArr[i+1]}"
   ;;

   "--novid")
     OptionDLVid=0
   ;;
  esac
done

while IFS= read -r VideoID; do
    wget $OptionWGetArgs -O "${VideoID}_640x360.jpg" "https://static-3.bitchute.com/live/cover_images/${ChannelID}/${VideoID}_640x360.jpg"
done < videos.txt
