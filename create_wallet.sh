#!/bin/bash
count=0
bin=$1
nomber=${2:-"10"}
pass="****"

save="{}"
while [ $count -lt 15 ]
  do
    (( count++ ))
  echo -e "wallet $count\n"
  ADDR=$(echo -e "$pass\ny"| $bin keys add $count | grep address | sed  's/^.*: //')
  echo "$save" | jq ".$count = $ADDR"
done
for i in $(echo "$save" | jq '. | keys | .[] | sed 's/\"//; s/\"$//' ' )
do 

done
