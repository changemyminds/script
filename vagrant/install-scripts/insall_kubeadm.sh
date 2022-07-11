#!/bin/bash -eux

# set version
export KUBECTL_VERSION=1.19.16

# don't forget run install_kubectl.sh in Vagrantfile
# install kubeadm kubelet
sudo apt-get install -y kubeadm=${KUBECTL_VERSION}-00 kubelet=${KUBECTL_VERSION}-00
sudo apt-mark hold kubelet kubeadm

# start kubeadm 
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# copy admin config to help kubeclt
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config