#/usr/bin/bash
bin=${1:-'gitopiad'}
chain_id=${2:-'gitopia-janus-testnet-2'}
node=${3:-'http://localhost:26657'}
wallet_name=${2:-'tothemars'}
denom=${3:-'utlore'}
password=${4:-'Papsan123'}
#m - minuts; h - hour;  
ttime=${5:-'1h'}
keyring_backend=${7:-'os'}

while :
do
  echo ""
  date
  echo ""
  ADDR_VAL=$( echo -e $password'\ny' | $bin keys show $wallet_name --keyring-backend $keyring_backend --bech val | grep address | sed  's/- address: //')
  ADDR=$( echo -e $password'\ny' | $bin keys show $wallet_name --keyring-backend $keyring_backend | grep address | sed  's/- address: //')
  echo $password | $bin tx distribution withdraw-rewards $ADDR_VAL --keyring-backend $keyring_backend --chain-id $chain_id --node $node --commission --from $wallet_name -y
  sleep 30
  amount=$($bin q bank balances $ADDR  --denom $denom | grep amount | sed  's/amount: "//'| sed  's/"$//')
  echo $password | $bin tx staking delegate $ADDR_VAL $amount$denom --keyring-backend $keyring_backend --chain-id $chain_id --node $node --from $wallet_name -y
  sleep $ttime
done
