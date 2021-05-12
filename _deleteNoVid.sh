#!/bin/sh

while read -r line
do
  #echo "$line"
  rm -r -f -- $(echo "$line" | sed 's/\///')
done < noVid.list

rm -f noVid.list
