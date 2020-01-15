#!/bin/bash


for server in $@; do
		echo "-------------$server----------"
		ssh root@$server "tune2fs -l /dev/sda1 | grep created | awk {\'print $3" "$4" "$5" "$6" "$7\'}; lsb_release -a | grep Description | cut -f2"
done

