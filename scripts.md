## Create Delete wallets
[script](https://github.com/ToTheMars2/Helper_for_nodes/blob/main/create_delete_wallets.sh)


install script
```
mkdir -p ~/.script_node/strout/ && cd ~/.script_node/
wget https://raw.githubusercontent.com/ToTheMars2/Helper_for_nodes/main/create_delete_wallets.sh && chmod +x create_delete_wallets.sh

```

## Get tokens from `url`

[script](https://github.com/ToTheMars2/Helper_for_nodes/blob/main/get_tokens_url.sh)

install script
```
mkdir -p ~/.script_node/strout/ && cd ~/.script_node/
wget https://raw.githubusercontent.com/ToTheMars2/Helper_for_nodes/main/get_tokens_url.sh && chmod +x get_tokens_url.sh

```
## Send tokens on `address`

[script](https://github.com/ToTheMars2/Helper_for_nodes/blob/main/send_tokens.sh)

install script
```
mkdir -p ~/.script_node/strout/ && cd ~/.script_node/
wget https://raw.githubusercontent.com/ToTheMars2/Helper_for_nodes/main/send_tokens.sh && chmod +x send_tokens.sh

```
## Get rewards and delegate

[script](https://github.com/ToTheMars2/Helper_for_nodes/blob/main/withdraw-rewards_delegate.sh)

install script
```
mkdir -p ~/.script_node/strout/ && cd ~/.script_node/
wget https://raw.githubusercontent.com/ToTheMars2/Helper_for_nodes/main/withdraw-rewards_delegate.sh && chmod +x withdraw-rewards_delegate.sh

```
Screen
```
#Examle
screen -S gitopia-rew_delegate
```
Crontab
```
crontab -e
0 * * * * bash -c "cd ~/.script_node && ./gitopia-rewards_delegate.sh >> /root/.script_node/strout/gitopia 2>&1"
```
## Vote

[file vote](https://github.com/ToTheMars2/Helper_for_nodes/blob/main/vote)

install script
```
mkdir -p ~/.script_node/vote/ && cd ~/.script_node/vote
wget https://raw.githubusercontent.com/ToTheMars2/Helper_for_nodes/main/vote/check_json.py
wget https://raw.githubusercontent.com/ToTheMars2/Helper_for_nodes/main/vote/vote.sh
chmod +x vote.sh

```
```
PATH=/bin:/usr/bin:/root/go/bin:/usr/local/lib/python3.8
0 14,2 * * * bash -c "cd ~/.script_node/vote/ && ./vote.sh >> answer 2>&1"

```

## Snapshot

```
install script
```
mkdir -p ~/.script_node/snapshot/ && cd ~/.script_node/snapshot

chmod +x snapshot.sh
```
```
PATH=/bin:/usr/bin:/root/go/bin:/usr/local/lib/python3.8
0 14,2 * * * bash -c "cd ~/.script_node/snapshot/ && ./snapshot.sh >> answer 2>&1"

```
