#
# CannyOS Ubuntu 14.04 lts base container
#
# https://github.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base
#
# (c) Pete Birley

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/scripts /root/scripts
RUN chmod -R +x /root/scripts/

# Set environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Upstart and DBus have issues inside docker.
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

#Create user
RUN adduser --disabled-password --gecos "" user
RUN echo 'user:acoman' |chpasswd

#Install ssh server
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd 

#Install startup & post install script
WORKDIR /CannyOS
ADD CannyOS/startup.sh CannyOS/startup.sh
RUN chmod +x /CannyOS/startup.sh
ADD CannyOS/startup.sh CannyOS/post-install.sh
RUN chmod +x /CannyOS/post-install.sh

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
ENTRYPOINT ["/CannyOS/startup.sh"]

# Expose ports.
#SSH
EXPOSE 22/tcp