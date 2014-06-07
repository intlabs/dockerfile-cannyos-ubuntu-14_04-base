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
curl https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base/master/CannyOS/CannyOS.splash
#     *****************************************************
#     *                                                   *
#     *        _____                    ____  ____        *
#     *       / ___/__ ____  ___  __ __/ __ \/ __/        *
#     *      / /__/ _ `/ _ \/ _ \/ // / /_/ /\ \          *
#     *      \___/\_,_/_//_/_//_/\_, /\____/___/          *
#     *                         /___/                     *
#     *                                                   *
#     *                                                   *
#     *****************************************************
echo "*                                                   *"
echo "*         Ubuntu docker container builder           *"
echo "*                                                   *"
echo "*****************************************************"
echo ""

# Build base container image
sudo docker build -t="intlabs/dockerfile-cannyos-ubuntu-14_04-base" github.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base

# Make shared directory on host
sudo mkdir -p "/CannyOS/build/dockerfile-cannyos-ubuntu-14_04-base"
# Ensure that there it is clear
sudo rm -r -f "/CannyOS/build/dockerfile-cannyos-ubuntu-14_04-base/*"

# Launch Built base container image
sudo docker run -i -t -d \
 --privileged=true --lxc-conf="native.cgroup.devices.allow = c 10:229 rwm" \
 --v "/CannyOS/build/dockerfile-cannyos-ubuntu-14_04-base":"/CannyOS/Host" \
 --name "dockerfile-cannyos-ubuntu-14_04-base" \
 intlabs/dockerfile-cannyos-ubuntu-14_04-base

x=0
while [ "$x" -lt 3600 -a ! -e "/CannyOS/build/dockerfile-cannyos-ubuntu-14_04-base/done" ]; do
   x=$((x+1))
   sleep 1.0
   echo -n "Post Install script run time: $x seconds"
done
if [ -e "/CannyOS/build/dockerfile-cannyos-ubuntu-14_04-base/done" ]
then
   echo "Completed Post Install Script in container"
   sudo docker commit -m="Added json gem" -a="Kate Smith" 
else
   echo "Post Install Script in container timed out"
fi