#!/bin/bash

#-> specify output file
#-> use showall url
wget -O test.html https://www.bitchute.com/channel/sirgorgejones/?showall=1

#grep "<a href=\"/video/" test.html
grep "<p class=\"video-card-title\"><a href=\"/video/" test.html > videos.txt
#<p class="video-card-title"><a href="/video/

#sed -i 's/\" class=\"spa\">/\r\n/g' videos.txt
#cp videos.txt videos2.txt
#grep "<p class=\"video-card-title\"><a href=\"/video/" videos2.txt > videos.txt

sed -i 's/ /\r\n/g' videos.txt
cp videos.txt videos2.txt
grep "href=\"/" videos2.txt > videos.txt
sed -i 's/href=\"\/video\///g' videos.txt
sed -i 's/\/\"//g' videos.txt

rm videos2.txt
while IFS= read -r line; do
if !(test -e "${line}"); then
  echo "${line}" >> videos2.txt
  #echo "not found ${line}"
  #mkdir "${line}"
#else
#  echo "found ${line}"  
fi
done < videos.txt


