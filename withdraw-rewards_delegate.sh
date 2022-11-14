#!/bin/bash
bin=$1
#time=$2
name_wallet=$2
to_val_address=$3
file=$4
chain=$5
node=$6
pass=$7

#count=0
#while true;
#  do
#    (( from_count++ ))
  
ADDR=$(echo $pass | $bin keys show $name_wallet --bech val --keyring-backend $file | grep address| sed "s/  address: //")

echo "Val Address $ADDR"
echo "Get comissi"

echo $pass | $bin tx distribution withdraw-rewards $ADDR --from $name_wallet --commission --chain-id $chain --node $node -y
ADDR=$(echo $pass | $bin keys show $name_wallet --keyring-backend $file | grep address| sed "s/- address: //")

echo "Show balances"
$bin q bank balances $ADDR


  
done
