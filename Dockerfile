FROM alpine:3.2
LABEL "author"="tanghuailong"
ENV http_proxy="http://web-proxy.atl.hp.com:8080" \
    https_proxy="http://web-proxy.atl.hp.com:8080"

RUN apk add --update nginx && apk add --update apache2-utils && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body && mkdir -p /nginxconfig/

COPY nginx.conf /etc/nginx/nginx.conf 
COPY website /usr/share/nginx/html 
COPY copyfile.sh /

RUN chmod 777 /copyfile.sh

CMD ["/copyfile.sh"]
CMD ["nginx", "-g", "daemon off;"]
