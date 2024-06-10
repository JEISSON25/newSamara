#!/bin/sh

# Reemplazar la variable de entorno en la configuración de Nginx
envsubst '${DOMAIN}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Asegúrate de que los certificados existan
if [ ! -f /etc/letsencrypt/live/${DOMAIN}/fullchain.pem ]; then
  echo "Generating self-signed certificates..."
  mkdir -p /etc/letsencrypt/live/${DOMAIN}
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/letsencrypt/live/${DOMAIN}/privkey.pem -out /etc/letsencrypt/live/${DOMAIN}/fullchain.pem -subj "/CN=${DOMAIN}"
else
  envsubst '${DOMAIN}' < /etc/nginx/conf.d/default-ssl.conf.template > /etc/nginx/conf.d/default-ssl.conf
fi

# Iniciar Nginx
nginx -g 'daemon off;'
