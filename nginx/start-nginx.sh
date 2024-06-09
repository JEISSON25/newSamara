#!/bin/sh

envsubst '${DOMAIN}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
envsubst '${DOMAIN}' < /etc/nginx/conf.d/default-ssl.conf.template > /etc/nginx/conf.d/default-ssl.conf
nginx -g 'daemon off;'
