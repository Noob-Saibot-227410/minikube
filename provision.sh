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






# Adicione o repositório de terceiros:

# Crie um arquivo para adicionar o repositório:
# sh
# Copiar código
# sudo nano /etc/apt/sources.list.d/docker.list
# Adicione o seguinte conteúdo ao arquivo:
# bash
# Copiar código
# deb [arch=i386] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable
# Salve e feche o arquivo.
# Importe a chave GPG do repositório:

# sh
# Copiar código
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Atualize o índice de pacotes e instale o Docker:

# sh
# Copiar código
# sudo apt-get update
# sudo apt-get install docker-ce
# Habilite o serviço do Docker:

# sh
# Copiar código
# sudo systemctl enable docker



Baixe o pacote Docker CE para a arquitetura i386 e a distribuição Debian:

sh
Copiar código
wget https://download.docker.com/linux/debian/dists/stretch/pool/stable/i386/docker-ce_18.09.1~3-0~debian-stretch_i386.deb
Certifique-se de substituir 18.09.1~3-0~debian-stretch pela versão específica que você deseja baixar.

Instale o pacote baixado:

sh
Copiar código
sudo dpkg -i docker-ce_18.09.1~3-0~debian-stretch_i386.deb


