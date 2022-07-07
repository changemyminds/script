#!/bin/bash -eux

# set version
export MINIKUBE_VERSION=v1.19.0

# download minikube binary and install
curl -Lo minikube https://storage.googleapis.com/minikube/releases/${MINIKUBE_VERSION}/minikube-linux-amd64
sudo install minikube /usr/local/bin/minikube
sudo apt-get install -y conntrack

# check version
sudo minikube version

# set minikube config
sudo minikube config set WantUpdateNotification false 
sudo minikube config set WantReportErrorPrompt false

# start minikube
sudo minikube start --vm-driver=none --kubernetes-version=${MINIKUBE_VERSION}
 
# check cluster-info
sudo minikube kubectl cluster-info

# fixed permission if you want to use kubectl whick needs install
# now you can use `sudo minikube kubectl` or `kubectl`
sudo cp -r /root/.kube /root/.minikube $HOME
sudo chown -R $USER $HOME/.kube $HOME/.minikube
sudo sed -i 's/root/home\/vagrant/g' ~/.kube/config