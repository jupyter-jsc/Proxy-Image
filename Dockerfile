FROM ubuntu:18.04

EXPOSE 8000

RUN apt update && apt install -y npm=3.5.2-0ubuntu4 nodejs=8.10.0~dfsg-2ubuntu0.4 && npm install -g configurable-http-proxy && npm install -g configurable-http-proxy-redis-backend && DEBIAN_FRONTEND=noninteractive apt install -y tzdata=2019c-0ubuntu0.18.04 && ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /etc/j4j/j4j_proxy

COPY 503.html /usr/local/lib/node_modules/configurable-http-proxy/lib/error/503.html

RUN chown nobody:root /usr/local/lib/node_modules/configurable-http-proxy/lib/error/503.html

RUN adduser --disabled-password --gecos '' j4j_proxy

USER j4j_proxy

COPY --chown=j4j_proxy:j4j_proxy ./scripts /etc/j4j/j4j_proxy

WORKDIR /etc/j4j/j4j_proxy

CMD /etc/j4j/j4j_proxy/start.sh
