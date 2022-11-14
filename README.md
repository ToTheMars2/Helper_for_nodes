* [scripts](https://github.com/ToTheMars2/Helper_for_nodes/blob/main/scripts.md)
*

# Helper_for_nodes



## Update cosmos blokchain through Github

Сhanges
```
git_hub_repo='' # exemple https://github.com/hypersign-protocol/hid-node.git
pero=$(echo $git_hub_repo | sed "s/^.*\///" | sed 's/.git//')
version='' # exemple v1.0.3
Name_config_file='' # exemple .hid-node
Name_service="" # exemple hypersingd

```
```
service $Name_service start
cd ~/$pero && git pull || git clone $git_hub_repo && cd ~/$pero
git checkout $vers
make build
service $Name_service start
```


