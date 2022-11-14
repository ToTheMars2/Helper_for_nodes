#!/bin/bash
count=0
while [ $count -lt 1000 ]
  do
    (( count++ ))
  echo "\nwallet $count"
  ADDR=$(gitopiad keys add $count < pass | grep address | sed  's/- address: //')
#  curl -X POST -d '{"address": "'"$ADDR"'", "coins": ["10000000unibi","100000000000unusd"]}' https://faucet.testnet-1.nibiru.fi/
  curl -s -X POST -d '{"address": "'"$ADDR"'"}' 'https://faucet.gitopia.com'

  done
