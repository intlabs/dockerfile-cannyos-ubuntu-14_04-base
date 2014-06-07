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

sudo docker build -t="intlabs/dockerfile-cannyos-ubuntu-14_04-base" github.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base
sudo docker run -it -rm --privileged=true --lxc-conf="native.cgroup.devices.allow = c 10:229 rwm" intlabs/desktop1