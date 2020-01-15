#!/bin/bash



for server in $@; do
		#echo "--------"$server"-------"
		#rsync -azP /var/tmp/bermuda root@$server:/var/tmp
		#echo "-----------finished copy------------"
		#ssh root@$server "mkdir -p /etc/opt/BESClient; cp -p /var/tmp/bermuda/actionsite.afxm /etc/opt/BESClient; rpm --force -ivh /var/tmp/bermuda/BESAgent-9.2.6.94-rhe5.x86_64.rpm; service besclient start; rpm -qa | grep BESAgent-9.2.6.94; service besclient status"
		echo "-------"$server"------"
		ssh root@$server "service besclient stop"
		echo "Moving Files"
		rsync /var/tmp/bermuda/BCAN/actionsite.afxm root@$server:/etc/opt/BESClient/
		rsync /var/tmp/bermuda/BCAN/besclient.config root@$server:/var/opt/BESClient/
		echo "Finished moving files"
		ssh root@$server "service besclient start"
done

