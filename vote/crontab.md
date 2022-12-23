
You have to enter it to crontab
```
PATH=/bin:/usr/bin:/root/go/bin:/usr/local/lib/python3.8
0 12 * * * bash -c "cd ~/.script_node/gov/ && ./test.sh >> goved_out 2>&1"
```
