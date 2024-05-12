Vagrant.configure("2") do |config|
    config.vm.box = "generic/ubuntu2004"
    config.vm.network "forwarded_port", guest: 8443, host: 8443
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
      vb.name = "minikube"
    end
  
    config.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y apt-transport-https curl conntrack
      sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
      sudo chmod +x minikube
      sudo mv minikube /usr/local/bin/
      echo "export PATH=$PATH:/usr/local/bin" >> ~/.bashrc
      sudo usermod -aG docker vagrant
      sudo apt-get install -y docker.io
      sudo systemctl enable docker
      sudo systemctl start docker
      sudo usermod -aG docker $USER
      newgrp docker
      echo y | minikube start --driver=docker
    SHELL
  end
  