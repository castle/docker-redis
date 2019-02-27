ARG VERSION

FROM redis:$VERSION

LABEL maintainer="Castle Intelligence, Inc. https://github.com/castle/docker-redis"

RUN apt-get update && apt-get install -y stunnel4

COPY redis/redis.conf /usr/local/etc/redis/redis.conf

RUN mkdir -p /usr/local/etc/stunnel
COPY generate-key.sh /usr/local/etc/stunnel
COPY stunnel/stunnel.conf /usr/local/etc/stunnel
COPY start.sh /

EXPOSE 6380

CMD ["/start.sh"]
