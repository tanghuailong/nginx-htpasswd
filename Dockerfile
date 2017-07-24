FROM opensuse:42.2

LABEL "author"="tanghuailong"

ENV http_proxy="http://web-proxy.atl.hp.com:8080" \
    https_proxy="http://web-proxy.atl.hp.com:8080"

RUN zypper --non-interactive in --recommends  nginx apache-utils curl wget; \
    zypper clean;
RUN mkdir -p /tmp/nginx/client-body && mkdir -p /htpassword/

COPY nginx/nginx.conf /etc/nginx/nginx.conf 
COPY app /usr/share/nginx/html 


CMD ["nginx", "-g", "daemon off;"]
