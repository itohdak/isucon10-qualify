#!/bin/bash

set -e

# install docker
sudo apt update
sudo apt install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# add $USER (isucon) to docker group
# sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version


# install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) # 何度かYを押下
sudo systemctl start netdata # -> port 19999

# install alp
wget https://github.com/tkuchiki/alp/releases/download/v1.0.5/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo install ./alp /usr/local/bin
rm -rf alp_linux_amd64.zip alp
