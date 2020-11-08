ARG VERSION

FROM redis:$VERSION

LABEL maintainer="Castle Intelligence, Inc. https://github.com/castle/docker-redis"

COPY redis /usr/local/etc/redis-cluster

COPY start.sh /

EXPOSE 6381
EXPOSE 6382
EXPOSE 6383
EXPOSE 6384
EXPOSE 6385
EXPOSE 6386

CMD ["/start.sh"]
