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




Remova versões existentes do Docker:

sh
Copiar código
sudo apt-get remove docker docker-engine docker.io containerd runc
Adicione o repositório do Docker:

sh
Copiar código
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
Note que estamos adicionando o repositório do Docker para a arquitetura amd64, pois não há suporte oficial para arquiteturas de 32 bits. Isso pode permitir que você instale uma versão antiga do Docker compatível com a sua arquitetura.

Instale o Docker CE manualmente:

Baixe a versão do Docker CE compatível com a sua arquitetura de 32 bits. Você pode procurar versões antigas no repositório do Docker CE para Debian.

Por exemplo, para a versão 18.06.3ce3-0~debian:

sh
Copiar código
wget https://download.docker.com/linux/debian/dists/stretch/pool/stable/i386/docker-ce_18.06.3~ce~3-0~debian_i386.deb
Instale o pacote baixado:

sh
Copiar código
sudo dpkg -i docker-ce_18.06.3~ce~3-0~debian_i386.deb
Verifique a instalação:

Verifique se o Docker foi instalado corretamente:

sh
Copiar código
sudo docker --version
