FROM redis:5.0.0

LABEL maintainer="Castle Intelligence, Inc. https://github.com/castle/docker-redis"

# RUN apt-get update && apt-get install -y stunnel4

COPY configs/redis.conf /usr/local/etc/redis/redis.conf

RUN mkdir -p /usr/local/etc/stunnel
# COPY stunnel/generate-key.sh /usr/local/etc/stunnel
# COPY stunnel/stunnel.conf /usr/local/etc/stunnel
COPY start.sh /usr/local/etc/stunnel

EXPOSE 6391
EXPOSE 6392
EXPOSE 6393

CMD ["/usr/local/etc/stunnel/start.sh"]
