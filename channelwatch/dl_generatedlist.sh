#!/bin/sh
# $1 : Filename for Video IDs List
#echo "($1)"
#echo "gen dl"

cd ..
OptionDownloadList=$1 #"channelmissing.txt"
#echo "test gen dl ($OptionDownloadList) -> downloadmany(deactivated)"
#cat $OptionDownloadList
./downloadmany.sh $(cat $OptionDownloadList)
echo "downloaded $OptionDownloadList"
#rm $OptionDownloadList
