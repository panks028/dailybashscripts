#!/bin/bash


none="bermuda"

for server in $@; do
	#status=`ssh root@$server ls -l /var/tmp | grep bermuda | awk {'print $9'}`
	#if [ "$status" != "$none" ]; then
		#echo "--------"$server"-------"
		#rsync -azP /var/tmp/bermuda root@$server:/var/tmp
		#echo "-----------finished copy------------"
		#ssh root@$server "mkdir -p /etc/opt/BESClient; cp -p /var/tmp/bermuda/actionsite.afxm /etc/opt/BESClient; rpm --force -ivh /var/tmp/bermuda/BESAgent-9.2.6.94-rhe5.x86_64.rpm; service besclient start; rpm -qa | grep BESAgent-9.2.6.94; service besclient status"
		#echo "-------"$server"------"
		ssh root@$server rpm -qa | grep BESAgent
		ssh root@$server "hostname && service besclient status"
		echo "---------------------"
	#fi
done

