#!/bin/bash
start=1
count=$start
bin=$1
nomber=${2:-""}
create_or_delete=${3:-"3"}
keyring="os"
pass="****"

save="{}"
nomber=$(($count+$nomber))
if [ $create_or_delete == "1" ]
then
        while [ $count -le $nomber ]
          do
          echo -e "create wallet $count\n"
          ADDR=$(echo -e "$pass\ny"| $bin keys add $count --keyring-backend $keyring | grep address | sed  's/^.*: //')
          c=\"$count\"
          a=\"$ADDR\"
          save=$(echo "$save" | jq ".$c = $a")
          echo "$save"
          ((count++))
          done
        count=$start
        while [ $count -le $nomber ]
            do
              c=\"$count\"
              value=$(echo "$save" | jq ".$c" | sed 's/\"//; s/\"$//' )
              echo "$count. $value"
              ((count++))
             done
elif [ $create_or_delete == "2" ]
then
        while [ $count -le $nomber ]
          do
          echo -e "delete wallet $count\n"
          ADDR=$(echo -e "$pass"| $bin keys delete $count -y --keyring-backend $keyring)
        ((count++))
        done
elif [ $create_or_delete == "3" ]
then
        while [ $count -le $nomber ]
          do
          echo -e "balance wallet $count\n"
          ADDR=$(echo -e "$pass"| $bin keys show $count -a --keyring-backend $keyring)
          $bin q bank balances $ADDR
          ((count++))
          done
else
  echo 'This option is incorrect'
fi
