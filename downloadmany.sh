#!/bin/bash 
#./downloadmany.sh https://www.bitchute.com/video/wP35rmT8MPX6/?list=subscriptions https://www.bitchute.com/video/nqRu9eOo3Gpd/?list=subscriptions

for param in "$@" 
do
    echo "${param}"
    ./downloadbitchute.sh "${param}";
done

#clear
echo "Downloaded"
