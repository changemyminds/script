#!/bin/bash -eux

# set version
export K3S_VERSION=v1.25.5+k3s1
export K3S_TOKEN=12345
export K3S_SERVER_IP=192.168.100.101
  
# download k3s install script and install
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=$K3S_VERSION \
  INSTALL_K3S_EXEC="server --write-kubeconfig ~/.kube/config" \
  K3S_KUBECONFIG_MODE="644" \
  K3S_TOKEN=$K3S_TOKEN sh -s - \
  --node-external-ip="$K3S_SERVER_IP"

# check version
k3s --version

# set KUBECONFIG environment variable
# You can use upstream Kubernetes command line tools such as kubectl or helm
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc

# check kubectl version
kubectl version

# install some package
# bash-completion -> avoid -bash: _get_comp_words_by_ref: command not found
# socat -> unable to do port forwarding: socat not found
sudo apt-get install -y bash-completion socat

# kubectl cheat sheet, see below
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
# https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-linux/
echo 'source <(kubectl completion bash)' >> ~/.bashrc
echo 'complete -o default -F __start_kubectl k' >> ~/.bashrc