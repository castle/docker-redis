#!/bin/bash

set -e

cd /usr/local/etc/stunnel;

./generate-key.sh

chmod 600 rediscert.pem

redis-server /usr/local/etc/redis/redis.conf
stunnel4 /usr/local/etc/stunnel/stunnel.conf
