#!/bin/bash -xv
DATE=$(date "+[%m-%d-%Y %H%M%S]")
HOSTNAME=$(hostname)
DATEF=$(echo "$DATE $HOSTNAME::")


if id -u "scanner" >/dev/null 2>&1; then
        echo "$DATEF User scanner already exists on $(hostname)"
else
        useradd scanner 
        echo "sc@nmep1s" | passwd scanner --stdin
	echo "$DATEF user scanner add to $(hostname)" 
        if grep -q "scanner ALL = (ALL)" /etc/sudoers; then
		echo "$DATEF user scanner already set in sudoers file" 
	else
		echo 'scanner ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers
		echo "$DATEF User was add to sudo file" 
	fi
fi

