#!/bin/bash

syslogs="10.232.60.73"
echo @@$(hostname)


if (grep -q $syslogs /etc/rsyslog.conf); then
	echo "syslog server $syslogs already exists"
else
	echo "*.debug         @$syslogs" >> /etc/rsyslog.conf
	service syslog restart
fi
