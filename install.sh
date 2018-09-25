#!/bin/sh

curl -sL https://get.docker.com | sh
sudo usermod -aG docker ubuntu

sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# sudo apt --yes install nginx
# sudo cp blog.conf /etc/nginx/sites-available/
# sudo ln -s /etc/nginx/sites-available/blog.conf /etc/nginx/sites-enabled/blog.conf
# sudo systemctl reload nginx

# sudo apt-get install --yes software-properties-common
# sudo add-apt-repository --yes ppa:certbot/certbot
# sudo apt update
# sudo apt-get install --yes python-certbot-nginx

# sudo rm /etc/nginx/sites-enabled/default
# sudo mkdir /var/www/dominikpiatek.com

sudo docker pull ghost:1.24.5
