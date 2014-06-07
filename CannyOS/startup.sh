#!/bin/sh
#
# Copyright 2014 Pete Birley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Run postinstall script if required.
if [ -e /CannyOS/post-install.sh ]; then
	/CannyOS/post-install.sh
	exit
fi

echo ""
echo "***************************************************************"
echo "***************************************************************"
echo "**                                                           **"
echo "**      Welcome to CannyOS:  startup script starting         **"
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
echo "**      Welcome to CannyOS:  startup script finished         **"
echo "**                                                           **"
echo "***************************************************************"
echo "***************************************************************"
echo ""

# Drop into shell
bash