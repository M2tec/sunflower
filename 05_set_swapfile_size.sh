#!/bin/bash

set -x

free -g -h -t

memory=`grep MemTotal /proc/meminfo | awk '{print $2}'`

swapsize=$(((${memory}/1000000)/2))
echo swapsize
swapbytes=$((swapsize * 1024))

echo "Set your swap file to half the size of memory"

sudo swapoff -a 
sudo rm /swapfile 
sudo fallocate -l ${swapsize}G /swapfile 
sudo dd if=/dev/zero of=/swapfile bs=1M count=${swapbytes}
sudo chmod 600 /swapfile 
sudo mkswap /swapfile 
sudo swapon /swapfile 

echo "reboot the machine"