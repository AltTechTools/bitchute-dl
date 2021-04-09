#!/bin/bash 
#./downloadbitchute.sh https://www.bitchute.com/video/xJNBHF80zAI/

for param in "$@" 
do
    ./downloadbitchute.sh "${param}";
done
