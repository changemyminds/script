$global_install_docker_script = <<-SHELL       
  # set version
  export DOCKER_VERSION=5:20.10.17~3-0~ubuntu-focal
  export CONTAINERD_IO_VERSION=1.6.6-1
    
  # install docker
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get install -y docker-ce=${DOCKER_VERSION} docker-ce-cli=${DOCKER_VERSION} containerd.io=${CONTAINERD_IO_VERSION}
  sudo usermod -aG docker ${USER}
  docker version

  # install bash-it
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
  bash ~/.bash_it/install.sh -s
 
  #Disable swap
  #https://github.com/kubernetes/kubernetes/issues/53533
  sudo swapoff -a && sudo sysctl -w vm.swappiness=0
  sudo sed '/vagrant--vg-swap/d' -i /etc/fstab  
SHELL

$global_install_kubectl_script = <<-SHELL
  export KUBECTL_VERSION=1.19.16
    
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates curl
  sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  
  sudo apt-get update
  sudo apt-get install -y kubectl=${KUBECTL_VERSION}-00
  sudo apt-mark hold kubectl

  # avoid -bash: _get_comp_words_by_ref: command not found
  sudo apt-get install -y bash-completion
  echo 'source <(kubectl completion bash)' >> ~/.bashrc

SHELL