#!/bin/bash -eux

# set version
export KUBECTL_VERSION=1.19.16

# if apt-get update failed use this
sudo sed -i 's/in\./us\./g' /etc/apt/sources.list

# add kubernetes repo  
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# install kubectl
sudo apt-get update
sudo apt-get install -y kubectl=${KUBECTL_VERSION}-00
sudo apt-mark hold kubectl

# install some package
# bash-completion -> avoid -bash: _get_comp_words_by_ref: command not found
# socat -> unable to do port forwarding: socat not found
sudo apt-get install -y bash-completion socat
 
# kubectl cheat sheet, see https://kubernetes.io/docs/reference/kubectl/cheatsheet/
echo 'source <(kubectl completion bash)' >> ~/.bashrc
alias k=kubectl
complete -o default -F __start_kubectl k