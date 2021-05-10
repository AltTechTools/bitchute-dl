#!/bin/sh

#Channelname="blackpilled"
#./listleftchannelvideos.sh --no-prompt "$Channelname"
#./dl_generatedlist.sh

for param in "$@" 
do
    #echo "dl_autolist.sh test: ${param}"
    ./listleftchannelvideos.sh --no-prompt --output-file "${param}.txt" "${param}" > "${param}.log"
    ./dl_generatedlist.sh "${param}.txt"
done

