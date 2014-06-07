#!/bin/sh
# (c) Pete Birley

# Run postinstall script if required.
if [ post-install.sh ]; then
	post-install.sh
fi

# Startup ssh
/usr/sbin/sshd -D &

# Drop into shell
bash