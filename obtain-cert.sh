#!/bin/sh

sudo certbot \
  --agree-tos \
  --non-interactive \
  --email $EMAIL \
  --webroot-path /var/www/$DOMAIN \
  --domains $DOMAIN \
  --authenticator webroot \
  --installer nginx 

