#!/bin/bash

#cd ..

paramArr=()

for param in "$@" 
do
    paramArr+=("${param}");
done

#also for e.v called dl skript
OptionNoPromptDL=0
OptionRedownload=0
OptionKeep=0
OptionDLVid=1
OptionDLHtml=1
OptionWGetArgs="-q --show-progress"
OptionInputFile="channel.html"
OptionDownloadList="channelmissing.txt"
OptionThisDir=$(printf '%s\n' "${PWD##*/}")


for (( i=0; (i+1)<${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "listleftchannelvideos.sh { Options } [URL]"
      echo "Available Options:"
      echo "--no-prompt: Don't Prompt, for Auto Behaviour, skip it. Usefull for skripts, which shouldn't require user input"
      echo "--redownload: Also include allready existing (by directory) videos for download"
      echo "--input-file: enables to specify a pre-downloaded html file name. Skips download and uses passed name to extract the video URLs"
      echo "--output-file: enables to specify the filename of the created video Id list."
      echo "--keep: Keep Tmp Files and Skripts"
      echo "--novid: Skip Video Download"
      echo "--wgetArgs: Next passed String defines Args for wget [default: \"-q --show-progress\"]"
      echo "-h/--help: This Help"
      exit
    ;;
    "--no-prompt")
      OptionNoPromptDL=1
    ;;
    "--input-file")
      OptionDLHtml=0
      OptionInputFile="${paramArr[i+1]}"
    ;;
    "--output-file")
      OptionDownloadList="${paramArr[i+1]}"
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

Videos=$(grep '<a href="/video/' $OptionInputFile |  awk 'NF==3 {print $2}' | sed '/class/ q' | grep -v "class=" | sed 's/href="\/video\///g' | sed 's/\///g' | sed 's/"//g')

cd ..

if [ -e "$OptionDownloadList" ]
then
  rm "$OptionDownloadList"
fi

for line in $Videos
do
  if !(test -e "${line}"); then
    echo " - dl: $line"
    echo "${line}" >> $OptionDownloadList
  else
    echo "exists ${line}" 
    if [ $OptionRedownload -ge 1 ]
    then
      echo "${line}" >> $OptionDownloadList
    fi
  fi
done

echo ""
echo "To Download:"
if [ -f "$OptionDownloadList" ]; then
  cat "$OptionDownloadList"
  #echo "exists"
else
  echo "none"
  #echo "doesn't exist"
fi


if [ $OptionNoPromptDL -lt 1 ]; then
  #echo$(echo "Ja" && echo "Nein")
  cd "$OptionThisDir"
  ./list_promptdl.sh "$OptionDownloadList"
fi
