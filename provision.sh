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





Para instalar o Docker Engine em um sistema Debian de 32 bits, você pode seguir as instruções fornecidas pelo Docker. No entanto, é importante observar que o Docker Engine não oferece suporte oficial para arquiteturas de 32 bits. Portanto, pode ser difícil encontrar uma versão compatível do Docker Engine para o seu sistema. Aqui está um resumo das etapas que você pode tentar:

Remova pacotes conflitantes: Antes de instalar o Docker Engine, remova quaisquer pacotes conflitantes que possam estar presentes no seu sistema. Você pode usar o seguinte comando para fazer isso:

sh
Copiar código
sudo apt-get remove docker docker-engine docker.io containerd runc
Adicione o repositório do Docker: Adicione o repositório do Docker ao seu sistema Debian:

sh
Copiar código
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
Observe que mesmo que a arquitetura seja especificada como amd64, você pode tentar usar este repositório para ver se ele contém uma versão do Docker Engine que possa ser instalada em uma arquitetura de 32 bits.

Instale o Docker Engine: Agora, você pode instalar o Docker Engine com o seguinte comando:

sh
Copiar código
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
Isso instalará o Docker Engine, o Docker CLI e o containerd.

Verifique a instalação: Verifique se o Docker Engine foi instalado corretamente executando o seguinte comando:

sh
Copiar código
sudo docker --version
Por favor, note que não há garantia de que o Docker Engine funcionará corretamente em uma arquitetura de 32 bits e pode ser necessário buscar alternativas, como usar uma versão mais antiga do Docker ou procurar por soluções de terceiros.



wget https://download.docker.com/linux/debian/dists/stretch/pool/stable/i386/docker-ce_18.06.3~ce~3-0~debian_i386.deb
sudo dpkg -i docker-ce_18.06.3~ce~3-0~debian_i386.deb
