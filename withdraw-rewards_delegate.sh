#!/bin/bash
bin=$1
#time=$2
name_wallet=$2
to_val_address=$3
file=$4
pass=$5

#count=0
#while true;
#  do
#    (( from_count++ ))
  <binary> keys show <keyname> --bech val
  ADDR=$(echo $pass | $bin keys show $name_wallet --bech val --keyring-backend $file | grep address| sed "s/- address: //")
  echo "Val Address $ADDR"
  echo "Get comissi"
  
  echo $pass | $bin tx bank send $ADDR $to_address 10000000utlore --from $from_count -y
  
  done
