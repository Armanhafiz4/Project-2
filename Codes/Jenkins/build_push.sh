#!/bin/bash

# Install Docker and Docker-compose and Add Jenkins to group
sudo apt install -y curl jq
curl https://get.docker.com | sudo bash
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker jenkins
sudo systemct1 restart jenkins

docker-compose build --parallel --build-arg APP_VERSION=${app_version}
docker-compose push
docker system prune -af