#!/bin/sh
# (c) Pete Birley

# Run postinstall script if required.
if [ /CannyOS/post-install.sh ]; then
	/CannyOS/post-install.sh
fi

# Startup ssh
/usr/sbin/sshd -D &

# Drop into shell
bash