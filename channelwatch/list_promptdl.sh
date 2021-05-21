#!/bin/sh
# $1 : Filename for Video IDs List
#echo "($1)"

echo ""
echo "Prompt Optional DL"
AskDL=$({ echo "Ja"; echo "Nein"; } | dmenu -i -l 2 -p "Download now?")
if [ $AskDL = "Ja" ]; then
  #¼echo "true"
  ./dl_generatedlist.sh $1
else
  echo "Aborted"
fi


