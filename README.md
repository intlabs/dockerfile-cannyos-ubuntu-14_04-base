## CannyOS Ubuntu Dockerfile


This repository contains the *Dockerfile* and *associated files* for setting up a container with Ubuntu for CannyOS

### Dependencies

* docker


### Installation

1. Install [Docker](https://www.docker.io/).

	For an Ubuntu 14.04 host the following command will get you up and running:

	`sudo apt-get -y update && sudo apt-get -y install docker.io && sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker && sudo restart docker.io`

2. You can then build the container from the Dockerfile:

	`sudo docker build -t="intlabs/dockerfile-cannyos-ubuntu-14_04-base" github.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base`

### Usage

* this will run and drop you into a session with privileges to run FUSE:

`sudo docker run -it --rm --privileged=true --lxc-conf="native.cgroup.devices.allow = c 10:229 rwm" intlabs/dockerfile-cannyos-ubuntu-14_04-base`
