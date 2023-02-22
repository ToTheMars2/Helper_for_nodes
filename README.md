* [scripts](https://github.com/ToTheMars2/Helper_for_nodes/blob/main/scripts.md)
* [Install Rust](https://www.rust-lang.org/tools/install)

# Helper_for_nodes



## Update cosmos blokchain

<b>through Github</b>

Сhanges
```
Name_bin='omniflixhubd' # hid-node 
Name_config_file='.omniflixhub' # exemple .hid-node
Name_service="omniflixhubd" # exemple hypersingd
git_hub_repo='https://github.com/OmniFlix/omniflixhub.git' # exemple https://github.com/hypersign-protocol/hid-node.git
pero=$(echo $git_hub_repo | sed "s/^.*\///" | sed 's/.git//')
version='v0.8.0' # exemple v1.0.3
rpc=$(sed -n "91 s/^.*://p" ~/$Name_config_file/config/config.toml | sed -n 's/"$//p')


```
```
service $Name_service stop
cd ~/$pero && git pull || git clone $git_hub_repo && cd ~/$pero
git checkout $version
$Name_bin version
make install
$Name_bin version
service $Name_service start
sleep 10
curl -s localhost:$rpc/consensus_state | jq '.result.round_state.height_vote_set[0].prevotes_bit_array'

```


