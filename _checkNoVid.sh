#!/bin/sh

rm -f noVid.list
while read -r line
do
  cd -- "$line"
  CountVid=$(ls | grep -c ".mp4")
  cd ..
  [ $CountVid -lt 1 ] && echo "$line" && echo "$line" >> noVid.list  # && echo "Test $CountVid"
done <<< $(ls -F | grep "/" | grep -v "channelwatch")

echo ""
echo "--> Stored in noVid.list"
