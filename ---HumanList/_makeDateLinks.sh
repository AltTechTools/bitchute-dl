#!/bin/sh
while read -r line
do
  DateFolderName=$(echo "$line" | sed 's/.datelist//')
  echo "${DateFolderName}"
  [ -d "$DateFolderName" ] || mkdir "$DateFolderName" || { echo "creating Folder(${DateFolderName}) failed"; exit -1; }
  cd -- "$DateFolderName" || { echo "failed to cd (${DateFolderName})"; exit -1; }
  RelatedVideos=$(cat "../${line}")
  while read -r relVideo
  do
    #echo "relVideo: ${relVideo}"
    relVidID=$(echo "${relVideo}" | awk '{print $1}' FS='{;sep;}')
    relChannelID=$(echo "${relVideo}" | awk '{print $3}' FS='{;sep;}')
    relVidTitle=$(echo "${relVideo}" | awk '{print $2}' FS='{;sep;}' | cut -c "1-255")
    relVidTitle=$(echo "$relVidTitle" | sed 's/\//_/g')
    [ -d "${relChannelID}" ] || mkdir -- "${relChannelID}" || { creating dir ${relChannelID} failed; exit 1; }
    cd "${relChannelID}" || { echo "cd to ${relChannelID} failed"; exit 1; }
    ln -s -- "../../../${relVidID}" "${relVidTitle}"
    cd ..
  done <<<${RelatedVideos}
  cd ..
  rm -- "${line}"
done <<<$(ls | grep ".datelist")
