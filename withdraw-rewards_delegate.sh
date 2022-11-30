#/usr/bin/bash
bin=${1:-'gitopiad'}
denom=${2:-'utlore'}
chain_id=${3:-'gitopia-janus-testnet-2'}
node=${4:-'http://localhost:26657'}
fees=${5:-''} #Exemple fees='--fees 2000utore' or '--gas-prices 0.01utore --gas 300000'; Default fees is nothing
tokens_that_left=${6:-'0'} # Default 0; this balance will remain in the wallet 
wallet_name=${7:-'tothemars'}
ttime='1h' # 1 - seconds; 1m - minuts; 1h - hour;
keyring_backend='os'
password='*****'


while :
do
  echo ""
  date
  echo ""
  ADDR_VAL=$( echo -e $password'\ny' | $bin keys show $wallet_name --keyring-backend $keyring_backend --bech val | grep address | sed  's/- a>
  ADDR=$( echo -e $password'\ny' | $bin keys show $wallet_name --keyring-backend $keyring_backend | grep address | sed  's/- address: //')
  echo $password | $bin tx distribution withdraw-rewards $ADDR_VAL --keyring-backend $keyring_backend --chain-id $chain_id --node $node $fees>
  sleep 30
  amount=$($bin q bank balances $ADDR --denom $denom --node $node | grep amount | sed  's/amount: "//'| sed  's/"$//')
  let rizn=$amount-$tokens_that_left
  echo $password | $bin tx staking delegate $ADDR_VAL $rizn$denom --keyring-backend $keyring_backend --chain-id $chain_id --node $node $fees >
  sleep $ttime
done
