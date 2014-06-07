#!/bin/sh
#
# CannyOS Ubuntu 14.04 lts base containers build script
#
# https://github.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base
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
echo "**   Welcome to CannyOS:  Ubuntu docker container builder    **"
echo "**                                                           **"
echo "***************************************************************"
echo "***************************************************************"
echo ""



echo "*                                                                                *"
echo "*    ____                                              _____       ____          *"
echo "*   /\\  _`\\                                           /\\  __\`\\    /\  _\`\\        *"
echo "*   \ \ \/\_\     __       ___      ___     __  __    \ \ \/\ \   \ \,\L\_\      *"
echo "*    \ \ \/_/_  /'__`\   /' _ `\  /' _ `\  /\ \/\ \    \ \ \ \ \   \/_\__ \      *"
echo "*     \ \ \L\ \/\ \L\.\_ /\ \/\ \ /\ \/\ \ \ \ \_\ \    \ \ \_\ \    /\ \L\ \    *"
echo "*      \ \____/\ \__/.\_\\ \_\ \_\\ \_\ \_\ \/`____ \    \ \_____\   \ `\____\   *"
echo "*       \/___/  \/__/\/_/ \/_/\/_/ \/_/\/_/  `/___/> \    \/_____/    \/_____/   *"
echo "*                                               /\___/                           *"
echo "*                                               \/__/                            *"



sudo docker build -t="intlabs/dockerfile-cannyos-ubuntu-14_04-base" github.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base

CONTAINER_MOUNT_POINT="~/CannyOS/dockerfile-cannyos-ubuntu-14_04-base"

mkdir -p "$CONTAINER_MOUNT_POINT"
sudo docker run -i -t --rm --privileged=true --lxc-conf="native.cgroup.devices.allow = c 10:229 rwm" -v $CONTAINER_MOUNT_POINT:/CannyOS/Host intlabs/dockerfile-cannyos-ubuntu-14_04-base

x=0
while [ "$x" -lt 3600 -a ! -e "$CONTAINER_MOUNT_POINT/done" ]; do
   x=$((x+1))
   sleep 1.0
   echo "Post Install script run time: $x seconds"
done
if [ -e "$CONTAINER_MOUNT_POINT/done" ]
then
   echo "Completed Post Install Script in container"
else
   echo "Post Install Script in container timed out"
fi