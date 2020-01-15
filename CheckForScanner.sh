#!/bin/bash


log='scannercheck.log'
list=$(cat $1)
for VM in $list;do
	ping -c 1 $VM
	if [ $? -ne 0 ]; then
		echo $VM - no ping >> $log
		continue
	fi
	ssh -oNumberOfPasswordPrompts=0 $VM "echo hello" > /dev/null 2>&1;
	if [ $? -ne 0 ]; then
		echo $VM - no ssh trust >> $log
		continue
	fi
	ssh $VM "id scanner" 
	if [ $? -ne 0 ]; then
		echo $VM - USER DONT EXIST >> $log
	else
		echo $VM - USER EXIST >> $log
	fi
		
done
