FROM nginx:1.21

COPY ./conf.d /etc/nginx/conf.d
COPY ./start-nginx.sh /start-nginx.sh

RUN chmod +x /start-nginx.sh

CMD ["/start-nginx.sh"]
