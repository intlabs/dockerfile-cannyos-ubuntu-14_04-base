#!/bin/sh
# (c) 2014 Pete Birley

echo "***************************************************************"
echo "***************************************************************"
echo "**                                                           **"
echo "**                                                           **"
echo "**               CannyOS post install script                 **"
echo "**                                                           **"
echo "**                                                           **"
echo "***************************************************************"
echo "***************************************************************"

#Move post-install script and timestamp it
mv "/CannyOS/post-install.sh" "/CannyOS/post-install.sh.done.$(date +%Y_%m_%d.%H_%M_%S)"