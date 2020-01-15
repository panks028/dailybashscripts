#!/bin/bash

list=$(cat $1)

for host in $list; do
	echo $host
	ssh $host 'bash -s' < add_scanner.sh
done
