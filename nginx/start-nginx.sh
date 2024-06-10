#!/bin/sh

# Asegúrate de que los certificados existan
while [ ! -f /etc/letsencrypt/live/${DOMAIN}/fullchain.pem ]; do
  echo "Waiting for certificates..."
  sleep 2
done

# Reemplazar la variable de entorno en la configuración de Nginx
envsubst '${DOMAIN}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
envsubst '${DOMAIN}' < /etc/nginx/conf.d/default-ssl.conf.template > /etc/nginx/conf.d/default-ssl.conf

# Iniciar Nginx
nginx -g 'daemon off;'
