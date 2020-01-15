#!/bin/bash -xv
DATE=$(date "+[%m-%d-%Y %H%M%S]")
HOSTNAME=$(hostname)
DATEF=$(echo "$DATE $HOSTNAME::")
user="cmdbim"
pass="Amdocs123"
sudoalias="Cmnd_Alias CMDB = /bin/cat, /bin/sh -c ls *, /bin/netstat, /usr/sbin/dmidecode, /usr/bin/gcore, /sbin/fdisk, /usr/bin/strace, /sbin/iscsi-ls, /usr/sbin/lvs, /sbin/lspci, /usr/bin/find /sys/class/scsi_host/"
sudoco="cmdbim  ALL = NOPASSWD: CMDB"
authkey="authorized_keys.$user"

if id -u "$user" >/dev/null 2>&1; then
        echo "$DATEF User $user already exists on $(hostname)"
else
        useradd $user
        echo $pass | passwd $user --stdin
        echo "$DATEF user $user add to $(hostname)"
        if grep -q "cmdbim ALL = NOPASSWD: CMDB" /etc/sudoers; then
                echo "$DATEF user $user already set in sudoers file"
        else
                echo $sudoalias >> /etc/sudoers
                echo $sudoco >> /etc/sudoers 
                echo "$DATEF User was add to sudo file"
        fi
	echo "looking for auth key file at $(pwd)/$authkey"
	if [ -f $authkey ];then
		echo "creating auth key from $authkey"
		mkdir -p /home/$user/.ssh
		cp $authkey /home/$user/.ssh/authorized_keys
		chown -R $user:sys /home/$user/.ssh/
	else
		echo "authkey was not found"
	fi
fi

