########################
# Docker
########################
echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo systemctl enable docker

########################
# Minikube
########################
echo "Installing Minikube"
sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo chmod +x minikube
sudo mv minikube /usr/local/bin/
echo "export PATH=$PATH:/usr/local/bin" >> ~/.bashrc
sudo usermod -aG docker $USER
newgrp docker
minikube start --driver=docker

########################
# Kubectl
########################
echo "Installing kubectl via Snap"
sudo snap install kubectl --classic