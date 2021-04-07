#!/bin/bash

grep "<link id=\"canonical\" " index.html > ChannelID.txt
sed -i 's/<link id=\"canonical\" rel=\"canonical\" href=\"https:\/\/www.bitchute.com\/channel\///g' ChannelID.txt
sed -i 's/\/\" \/>//g' ChannelID.txt

