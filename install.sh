#!/bin/sh

curl -sL https://get.docker.com | sh
sudo usermod -aG docker ubuntu

sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo docker pull ghost:1.24.5
sudo docker pull staticfloat/nginx-certbot