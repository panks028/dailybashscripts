#!/bin/bash



if id -u "discover" >/dev/null 2>&1; then
	echo "User discover already exists on $(hostname)"
else 
	useradd -s /bin/sh -d /usr/local/discover -g 3 discover
	echo 'discover:Unix!1' | chpasswd
	mkdir -p /usr/local/discover
	chown discover:sys /usr/local/discover
	mkdir -p /usr/local/discover/.ssh
	chown discover:sys /usr/local/discover/.ssh
	touch /usr/local/discover/.ssh/authorized_keys
	chown discover:sys /usr/local/discover/.ssh/authorized_keys
	chmod 644 /usr/local/discover/.ssh/authorized_keys
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCwvjh6ofXrO4JyJDq3jBFaPk69zoOh1p4VliMNxfvu9vhlLhgcNflcN4v+qhJ//vr37DPCVlJ3namfvGyrBBd5hXnfs1+tFHHKy9PiBQdi8UyrLwr5BJuaEqO+5H7NVDy2EdQMGNPw/SzW9gxSussyVddoF0Mm7MqsoNyvZ6koJw==" >> /usr/local/discover/.ssh/authorized_keys

fi 

