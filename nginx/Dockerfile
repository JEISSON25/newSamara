FROM nginx:1.21

COPY ./conf.d/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY ./start-nginx.sh /start-nginx.sh

RUN chmod +x /start-nginx.sh

CMD ["/start-nginx.sh"]
