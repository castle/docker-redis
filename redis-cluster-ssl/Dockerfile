ARG VERSION

FROM redis:$VERSION

LABEL maintainer="Castle Intelligence, Inc. https://github.com/castle/docker-redis"

COPY redis/redis.conf /usr/local/etc/redis/redis.conf

RUN apt-get update && apt-get install -y stunnel4

RUN mkdir -p /usr/local/etc/stunnel
COPY generate-key.sh /usr/local/etc/stunnel
COPY stunnel/stunnel.conf /usr/local/etc/stunnel

COPY start.sh /

EXPOSE 6381
EXPOSE 6382
EXPOSE 6383

CMD ["/start.sh"]
