FROM v2fly/v2fly-core

RUN apk add nginx

COPY config.json /etc/v2ray/config.json
COPY cmd.sh /root/cmd.sh
COPY www    /root/www
RUN chown -R nginx:nginx /root/www
RUN chown -R nginx:nginx /var/lib/nginx
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY main-nginx.conf /etc/nginx/nginx.conf

CMD /bin/sh ./cmd.sh