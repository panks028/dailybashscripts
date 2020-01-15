#!/bin/bash


log='oscheck.log'
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
	release=$(ssh $VM "cat /etc/redhat-release" | awk '{print "RHEL "$7}')
	if [ $? -ne 0 ]; then
		echo $VM - FAILED TO READ /etc/redhat-release >> $log
	else
		echo $VM - $release >> $log
	fi
		
done
