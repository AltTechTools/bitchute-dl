paramArr=()

for param in "$@" 
do
    paramArr+=("${param}");
done

 
echo "${paramArr[1]}"
echo ${#paramArr[@]}

#echo "for"
for (( i=0; (i+1)<${#paramArr[@]}; i++))
do 
 echo "${paramArr[i]}"
done

echo "And last:"
echo "${paramArr[${#paramArr[@]}-1]}"
