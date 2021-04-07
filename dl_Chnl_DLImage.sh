#!/bin/bash

ChannelID=$(cat ChannelID.txt)
#"vEzYfW0ALXeN"
#VideoID="6JWUMRgvIEI"

#https://static-3.bitchute.com/live/cover_images/vEzYfW0ALXeN/6JWUMRgvIEI_640x360.jpg
while IFS= read -r line; do
    VideoID="${line}"
    #echo "... $line ..."
    wget "https://static-3.bitchute.com/live/cover_images/${ChannelID}/${VideoID}_640x360.jpg"

done < videos.txt
