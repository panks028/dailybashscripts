#!/bin/bash

serversList=$(cat check_last_change_list)

for server in $serversList; do
echo -n "$server	"; ssh $server -c 'chage -l root | head -n 1 | awk -F ":" '{print "date -d \""$2"\" +%m-%d-%Y"}' | bash'
done
