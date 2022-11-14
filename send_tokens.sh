#!/bin/bash
bin=$1
from_count=$2
nomber=$3
to_address=$4

count=0
while [ $from_count -lt $nomber ]
  do
    (( from_count++ ))

  ADDR=$(echo 'Papsan123' | $bin keys show $from_count | grep address| sed "s/- address: //")
  echo "wallet $from_count $ADDR"
  echo 'Papsan123' | $bin tx bank send $ADDR $to_address 10000000utlore --from $from_count -y
  
  done
