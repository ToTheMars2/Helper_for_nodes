#!/bin/bash
start=1
count=$start
bin=$1
create_or_delete=${2:-"true"}
nomber=${3:-"10"}
pass="****"

save="{}"
if $create_or_delete
then
	while [ $count -le $nomber ]
	  do
	  echo -e "create wallet $count\n"
	  ADDR=$(echo -e "$pass\ny"| $bin keys add $count | grep address | sed  's/^.*: //')
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
else
	while [ $count -le $nomber ]
          do
          echo -e "delete wallet $count\n"
          ADDR=$(echo -e "$pass"| $bin keys delete $count -y)
        ((count++))
        done
fi

