#!/bin/sh
# (c) 2014 Pete Birley

echo ""
echo "***************************************************************"
echo "***************************************************************"
echo "**                                                           **"
echo "**                                                           **"
echo "**          CannyOS post-install script starting             **"
echo "**                                                           **"
echo "**                                                           **"
echo "***************************************************************"
echo "***************************************************************"
echo ""

# Put content of script here

#Install ssh server
apt-get install -y openssh-server
mkdir -p /var/run/sshd 

echo ""
echo "***************************************************************"
echo "***************************************************************"
echo "**                                                           **"
echo "**                                                           **"
echo "**         CannyOS post-install script completed             **"
echo "**                                                           **"
echo "**                                                           **"
echo "***************************************************************"
echo "***************************************************************"
echo ""

#Move post-install script and timestamp it
mv "/CannyOS/post-install.sh" "/CannyOS/post-install.done.$(date +%Y_%m_%d.%H_%M_%S)"

#Create bash shell
bash &