#!/bin/bash
list_gov_network='{"stargaze":{"bin":"starsd" , "fees":"", "node":"", "chain_id":"", "from":"--from papsan", "pass":"******"} }'

for platforms in $(echo $list_gov_network | jq '. | keys | .[]')
do
    platform=$(echo "$platforms" | sed  's/\"//; s/\"$//')
    bin=$(echo $list_gov_network | jq ".$platform.bin" | sed  's/\"//; s/\"$//')
    echo "$platform $bin $platforms"
    for id in  $( echo "$(echo $list_gov_network | jq ".$platform.pass" | sed  's/\"//; s/\"$//' )"| $bin q gov proposals --reverse -o json | jq ' .proposals[] | select(.status=="PROPOSAL_STATUS_VOTING_>
        do
          id=$(echo "$id"| sed  's/\"//; s/\"$//') # $(starsd q gov proposals --limit 11 --reverse -o json | jq ' .proposals[] | select(.status=="PROPOSAL_STATUS_VOTING_PERIOD") | .proposal_id')
          echo " $count. $id"

          if $(python3 check_json.py $platform $id )
          then
              date 
              echo "$(echo $list_gov_network | jq ".$platform.bin" | sed  's/\"//; s/\"$//') tx gov vote $id yes $(echo $list_gov_network | jq ".$platform.from" | sed  's/\"//; s/\"$//') $(echo $list_go>
              echo "$(echo $list_gov_network | jq ".$platform.pass" | sed  's/\"//; s/\"$//' )" | $(echo $list_gov_network | jq ".$platform.bin" | sed 's/\"//; s/\"$//') tx gov vote $id yes $(echo $list>
              echo 'TRUE'
          else
              echo "I voted for this proposol $platform $id "
          fi
        sleep 3
    done
done
