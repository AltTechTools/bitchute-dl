#!/bin/bash 

Channel=$(grep "<p class=\"video-card-channel\">" index.html | sed 's/<p class=\"video-card-channel\"><a href=\"\///g' | sed 's/\" class=\"spa\">/\r\n/g' | grep "channel")
Channel="https://www.bitchute.com/${Channel}"

echo $Channel > Channel.txt
sed -i 's/%0D\///g' Channel.txt
