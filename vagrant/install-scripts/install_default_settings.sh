#!/bin/bash -eux

# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh -s

#Disable swap
#https://github.com/kubernetes/kubernetes/issues/53533
sudo swapoff -a && sudo sysctl -w vm.swappiness=0
sudo sed '/vagrant--vg-swap/d' -i /etc/fstab  