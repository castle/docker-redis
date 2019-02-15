#!/bin/bash

set -e

cd /usr/local/etc/stunnel;

./generate-key.sh

chmod 600 rediscert.pem

echo "connect = $HOST:6379" >> stunnel.conf

redis-server /usr/local/etc/redis/redis.conf
stunnel4 /usr/local/etc/stunnel/stunnel.conf
