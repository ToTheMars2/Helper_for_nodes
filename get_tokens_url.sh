count=0
bin=$1
pass="****"
while [ $count -lt 1000 ]
  do
    (( count++ ))
  echo "\nwallet $count"
  ADDR=$(echo "$pass" | $bin keys add $count  | grep address | sed  's/^.*: //')
#  curl -X POST -d '{"address": "'"$ADDR"'", "coins": ["10000000unibi","100000000000unusd"]}' https://faucet.testnet-1.nibiru.fi/
#  curl -s -X POST -d '{"address": "'"$ADDR"'"}' 'https://faucet.gitopia.com'
 curl -X POST \
 -d '{"address": "'"$ADDR"'", "coins": ["500000000ulava"]}' \
 https://faucet-api.lavanet.xyz/faucet/
  done
