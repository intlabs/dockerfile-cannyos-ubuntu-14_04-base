#!/bin/sh
# (c) 2014 Pete Birley


#Move post-install script and timestamp it
mv "post-install.sh" "post-install.sh.done.$(date +%Y_%m_%d.%H_%M_%S)"