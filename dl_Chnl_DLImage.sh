#!/bin/bash

ChannelID=$(cat ChannelID.txt)
#"vEzYfW0ALXeN"
#VideoID="6JWUMRgvIEI"

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
    *)
      #echo "else"
      #echo "${paramArr[i]}"
    ;;
  esac
  #echo "${paramArr[i]}"
  #echo "${paramArr[${#paramArr[@]}-1]}"
done

#https://static-3.bitchute.com/live/cover_images/vEzYfW0ALXeN/6JWUMRgvIEI_640x360.jpg
while IFS= read -r VideoID; do
    #VideoID="${line}"
    #echo "... $line ..."
    wget $OptionWGetArgs -O "${VideoID}_640x360.jpg" "https://static-3.bitchute.com/live/cover_images/${ChannelID}/${VideoID}_640x360.jpg"

done < videos.txt
