#!/bin/sh
# (c) Pete Birley

# Run postinstall script if required.
if [ /CannyOS/post-install.sh ]; then
	/CannyOS/post-install.sh
fi

echo ""
echo "***************************************************************"
echo "***************************************************************"
echo "**                                                           **"
echo "**                                                           **"
echo "**      Welcome to CannyOS:  startup script starting         **"
echo "**                                                           **"
echo "**                                                           **"
echo "***************************************************************"
echo "***************************************************************"
echo ""

#Startup script begins:

# Startup ssh server to allow incomming connections.
/usr/sbin/sshd -D &


echo ""
echo "***************************************************************"
echo "***************************************************************"
echo "**                                                           **"
echo "**                                                           **"
echo "**      Welcome to CannyOS:  startup script finished         **"
echo "**                                                           **"
echo "**                                                           **"
echo "***************************************************************"
echo "***************************************************************"
echo ""

# Drop into shell
bash