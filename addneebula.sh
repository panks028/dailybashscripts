#!/bin/bash
if id -u "neebula" >/dev/null 2>&1; then
	echo "User neebula already exists on $(hostname)"
else 
	useradd neebula
	echo SerCheNee1! | passwd neebula --stdin
	echo 'neebula ALL=/bin/netstat,/bin/ls,/usr/sbin/lsof -Pnl +M' >> /etc/sudoers
fi 

