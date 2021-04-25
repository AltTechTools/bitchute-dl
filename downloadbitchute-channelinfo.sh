#!/bin/bash 

#test - to parameter later
#Channel=$(cat Channel.txt)
tmpName=$(cat Channel.txt | sed 's/https:\/\/www.bitchute.com\/channel\///g' | sed 's/\r//g' | sed 's/“//g' | sed 's/\///g')
echo $tmpName

paramArr=()

for param in "$@" 
do
    paramArr+=("${param}");
done

OptionKeep=0
OptionWGetArgs="-q --show-progress"

for (( i=0; (i)<${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "downloadbitchute.sh { Options } [URL]"
      echo "Available Options:"
      echo "--keep: Keep Tmp Files and Skripts"
      echo "--wgetArgs: NExt passed String defines Args for wget [default: \"-q --show-progress\"]"
      echo "-h/--help: This Help"
      exit
    ;;
    "--keep")
      OptionKeep=1
      #echo "k param"
      #echo "${paramArr[i+1]}"
   ;;
   "--wgetArgs")
     OptionWGetArgs="${paramArr[i+1]}"
   ;;
    *)
      #echo "else"
      #echo "${paramArr[i]}"
    ;;
  esac
  #echo "${paramArr[i]}"
  #echo "${paramArr[${#paramArr[@]}-1]}"
done


#exit
#wget $Channel
#echo $Channel > tmp.txt

#cp tmp.txt tmporig.txt
#sed -i 's/https:\/\/www.bitchute.com\/channel\///g' tmp.txt

#sed -i 's/\r//g' tmp.txt
#sed -i 's/“//g' tmp.txt
#sed -i 's/\///g' tmp.txt

#tmpName=$(cat tmp.txt)
#echo $tmpName
#rm tmp.txt

mkdir "${tmpName}"
cp dl_Chnl_*.sh "${tmpName}/"
cp videos.txt "${tmpName}/"
cd "${tmpName}"

#$tmpName

wget $OptionWGetArgs -O "index.html" "https://www.bitchute.com/channel/${tmpName}/"

./dl_Chnl_Description.sh
./dl_Chnl_ChannelID.sh
./dl_Chnl_DLImage.sh --wgetArgs $OptionWGetArgs

#exit
if [ $OptionKeep -lt 1 ]
then 
rm index.html
rm ChannelID.txt
rm videos.txt
rm *.sh
fi
