#!/bin/sh
WorkDir=$(pwd)
cd ..
Videos=$(ls -F | grep '/' | grep -v "channelwatch" | grep -v "HumanList" | sed 's/\///')

for Video in $Videos
do
  cd -- "$Video"
  ChannelName=$(ls -F | grep "/" | sed 's/\///')
  Title=$(cat Title.txt)
  if [ -f date.txt ]; then
    Date=$(cat date.txt)
    echo "${Video}{;sep;}${Title}{;sep;}${ChannelName}" >> "${WorkDir}/${Date}.datelist"
  fi
  cd ..
done
