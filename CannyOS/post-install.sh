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
bash 