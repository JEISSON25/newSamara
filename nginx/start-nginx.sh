#!/bin/sh

# Verificar que la variable DOMAIN esté definida
if [ -z "$DOMAIN" ]; then
  echo "Error: La variable de entorno DOMAIN no está definida."
  exit 1
fi

# Reemplazar la variable de entorno en la configuración de Nginx
envsubst '${DOMAIN}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Iniciar Nginx
nginx -g 'daemon off;'
