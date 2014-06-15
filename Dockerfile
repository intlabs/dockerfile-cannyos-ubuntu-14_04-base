#
# CannyOS Ubuntu 14.04 lts base container
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

# Pull base image.
FROM ubuntu:14.04

MAINTAINER "Pete Birley (petebirley@gmail.com)"

# Install base utilities.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget sed

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/scripts /root/scripts
RUN chmod -R +x /root/scripts/*

# Set environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Set the working directory
WORKDIR /

# Upstart and DBus have issues inside docker.
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

#Create user
#RUN adduser --disabled-password --gecos "" user
#RUN echo 'user:acoman' |chpasswd
RUN <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-utils/master/base-containers/add-user/adduser.sh) ubuntu

#Add startup & post-install script
ADD /CannyOS/startup.sh /CannyOS/startup.sh
RUN chmod +x /CannyOS/startup.sh
ADD /CannyOS/post-install.sh /CannyOS/post-install.sh
RUN chmod +x /CannyOS/post-install.sh
ADD /CannyOS/CannyOS.splash /CannyOS/CannyOS.splash

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
ENTRYPOINT ["/CannyOS/startup.sh"]