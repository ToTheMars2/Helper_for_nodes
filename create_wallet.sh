#!/bin/bash
count=0
bin=$1
nomber=${2:-"10"}
while [ $count -lt 15 ]
  do
    (( count++ ))
  echo -e "wallet $count\n"
  ADDR=$(echo -e 'Papsan123\ny' | gitopiad keys add $count | grep address | sed  's/^.*: //')
  
  done
