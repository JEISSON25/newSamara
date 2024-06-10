#!/bin/sh

# Asegúrate de que los certificados existan

# Reemplazar la variable de entorno en la configuración de Nginx
envsubst '${DOMAIN}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Iniciar Nginx
nginx -g 'daemon off;'
