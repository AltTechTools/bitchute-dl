#!/bin/bash 

Channel=$(grep "<p class=\"video-card-channel\">" index.html)
echo $Channel > Channel.txt

sed -i 's/<p class=\"video-card-channel\"><a href=\"\///g' Channel.txt
sed -i 's/\" class=\"spa\">/\r\n/g' Channel.txt
grep "channel" Channel.txt > Channel2.txt

Channel=$(cat Channel2.txt)
Channel="https://www.bitchute.com/${Channel}"

echo $Channel > Channel.txt
sed -i 's/%0D\///g' Channel.txt

rm Channel2.txt
