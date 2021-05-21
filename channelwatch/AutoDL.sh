#!/bin/sh

#TODO: loop for all defined

#Channelname="blackpilled"

./dl_autolist.sh $(cat AutoDL_List.txt) #"$Channelname"

cd -- ../---HumanList/
[ -f AllKnownVids.list  ] || ls -R > AllKnownVids.list  
./_deleteFolders.sh
./_listChannels.sh
./_makeLinks.sh
ls -R > NewAllKnownVids.list
diff AllKnownVids.list NewAllKnownVids.list > ___new.txt

