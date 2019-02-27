#!/bin/bash

set -e

cd /usr/local/etc/stunnel;

# ./generate-key.sh

# chmod 600 rediscert.pem

redis-server /usr/local/etc/redis/redis.conf --port 6391 --cluster-config-file nodes-6391.conf
redis-server /usr/local/etc/redis/redis.conf --port 6392 --cluster-config-file nodes-6392.conf
redis-server /usr/local/etc/redis/redis.conf --port 6393 --cluster-config-file nodes-6393.conf

echo "yes" | redis-cli --cluster create 127.0.0.1:6391 127.0.0.1:6392 127.0.0.1:6393

# stunnel4 /usr/local/etc/stunnel/stunnel.conf

while true; do
  :
done
