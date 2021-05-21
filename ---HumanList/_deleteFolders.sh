#!/bin/sh
while read -r line
do
rm -r -f -- "$line"
done <<<$(ls -F | grep '/')
