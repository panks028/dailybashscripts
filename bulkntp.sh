#!/bin/bash
list=$(cat /home/pankasha/ntputs)

for host in $list; do
        echo $host
        ssh $host 'bash -s' < checkntp.sh
done
