#!/bin/sh
while read -r line
do
  ChannelName=$(echo "$line" | sed 's/.chnllist//')
  echo "${ChannelName}"
  [ -d "$ChannelName" ] || mkdir "$ChannelName" || { echo "creating Folder(${ChannelName}) failed"; exit -1; }
  cd -- "$ChannelName" || { echo "failed to cd (${ChannelName})"; exit -1; }
  RelatedVideos=$(cat "../${line}")
  while read -r relVideo
  do
    #echo "relVideo: ${relVideo}"
    relVidID=$(echo "${relVideo}" | awk '{print $1}' FS='{;sep;}')
    relVidTitle=$(echo "${relVideo}" | awk '{print $2}' FS='{;sep;}' | cut -c "1-255")
    #echo "ID: $relVidID"
    #echo "Title: $relVidTitle"
    relVidTitle=$(echo "$relVidTitle" | sed 's/\//_/g')
    ln -s -- "../../${relVidID}" "${relVidTitle}"
  done <<<${RelatedVideos}
  cd ..
  rm -- "${line}"
done <<<$(ls | grep ".chnllist")
