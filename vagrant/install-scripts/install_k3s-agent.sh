#!/bin/bash -eux

# set version
export K3S_VERSION=v1.25.5+k3s1
export K3S_TOKEN=12345
export K3S_SERVER_IP=192.168.100.101
  
# download k3s install script and install
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=$K3S_VERSION \
  K3S_URL=https://$K3S_SERVER_IP:6443 \
  K3S_TOKEN=$K3S_TOKEN sh -s -