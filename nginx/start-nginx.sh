#!/bin/sh

# Esperar hasta que los certificados estén disponibles
# while [ ! -f /etc/letsencrypt/live/${DOMAIN}/fullchain.pem ]; do
#   echo "Waiting for certificates..."
#   sleep 2
# done

envsubst '${DOMAIN}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
envsubst '${DOMAIN}' < /etc/nginx/conf.d/default-ssl.conf.template > /etc/nginx/conf.d/default-ssl.conf
nginx -g 'daemon off;'
