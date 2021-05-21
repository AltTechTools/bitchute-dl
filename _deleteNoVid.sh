#!/bin/sh
#  	Parameters:
# 1	Keep [Optiona] "keep" to keep the list

while read -r line
do
  #echo "$line"
  rm -r -f -- $(echo "$line" | sed 's/\///')
done < noVid.list

[ "$1" = "keep" ] || rm -f noVid.list
