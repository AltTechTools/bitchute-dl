#!/bin/sh

#TODO: loop for all defined

#Channelname="blackpilled"
Workdir=$PWD
./dl_autolist.sh $(cat AutoDL_List.txt) #"$Channelname"
cd $Workdir

cd -- ../---HumanList/ || { echo "failed to change to HumanList Dir, curr: ${PWD}" ; exit 1; }
[ -f AllKnownVids.list  ] || ls -R > AllKnownVids.list  
./_deleteFolders.sh
./_listChannels.sh
./_makeLinks.sh
./_listDates.sh
./_makeDateLinks.sh
ls -R > NewAllKnownVids.list
diff AllKnownVids.list NewAllKnownVids.list > ___new.txt

