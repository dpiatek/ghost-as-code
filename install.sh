#!/bin/sh

curl -sL https://get.docker.com | sh
sudo usermod -aG docker ubuntu

sudo apt --yes install nginx
sudo cp blog.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/blog.conf /etc/nginx/sites-enabled/blog.conf
sudo systemctl reload nginx

sudo apt-get install --yes software-properties-common
sudo add-apt-repository --yes ppa:certbot/certbot
sudo apt update
sudo apt-get install --yes python-certbot-nginx

sudo rm sites-enabled/default
sudo mkdir /var/www/dominikpiatek.com

sudo certbot \
  --agree-tos \
  --non-interactive \
  --email do.piatek@gmail.com \
  --webroot-path /var/www/dominikpiatek.com \
  --domains dominikpiatek.com \
  --test-cert \
  --authenticator webroot
  --installer nginx
