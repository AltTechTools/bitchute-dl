#!/bin/sh

#best:
printf '%s\n' "${PWD##*/}"
exit

DirThis=$(pwd)
cd ..
DirTop=$(pwd)

DirTop=$(echo "$DirTop/")
#echo DirTop
#{ echo $DirThis; echo $DirTop; }
DirTop=$(echo $DirTop | sed 's/\//\\\//g')
#echo "s/$DirTop//"
TestSED=$(echo "s/$DirTop//")
#echo $TestSED

echo $DirThis | sed $TestSED
