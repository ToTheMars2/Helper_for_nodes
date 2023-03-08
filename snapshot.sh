NAME_NETWORK=Okp4
bin=okp4d
serviced=okp4d
path_data=/root/.okp4d/data
last_block=$($bin status | jq -r ".SyncInfo.latest_block_height")
name_file="Snapshot_$NAME_NETWORK"


service $serviced stop

echo -e "\nSnapshot_height $last_block\n"

echo "cosmprund prune $path_data --cosmos-sdk=false"
cosmprund prune $name_file --cosmos-sdk=false
cp -r $path_data ~/.script_node/snapshot
service $serviced start

echo "tar -czpf $name_file.tar.gz data"
tar -czpf $name_file.tar.gz data
rm -r /var/www/html/$name_file.tar.gz
mv $name_file.tar.gz /var/www/html/
rm -r data
echo "http://$(curl ifconfig.me)/$name_file.tar.gz"
echo "Finish"
