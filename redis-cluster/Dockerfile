ARG VERSION

FROM redis:$VERSION

LABEL maintainer="Castle Intelligence, Inc. https://github.com/castle/docker-redis"

COPY redis/redis.conf /usr/local/etc/redis/redis.conf

COPY start.sh /

EXPOSE 6391
EXPOSE 6392
EXPOSE 6393

CMD ["/start.sh"]
