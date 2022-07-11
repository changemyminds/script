#!/bin/bash -eux

# set version
export DOCKER_VERSION=5:19.03.15~3-0~ubuntu-focal
export CONTAINERD_IO_VERSION=1.6.6-1

# if apt-get update failed use this
sudo sed -i 's/in\./us\./g' /etc/apt/sources.list

# add docker repo and install docker
sudo apt-get update
sudo apt-get install -y ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce=${DOCKER_VERSION} docker-ce-cli=${DOCKER_VERSION} containerd.io=${CONTAINERD_IO_VERSION}
sudo usermod -aG docker ${USER}
sudo docker version

# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh -s

#Disable swap
#https://github.com/kubernetes/kubernetes/issues/53533
sudo swapoff -a && sudo sysctl -w vm.swappiness=0
sudo sed '/vagrant--vg-swap/d' -i /etc/fstab  