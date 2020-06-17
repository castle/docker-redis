#!/bin/bash

set -e

cd /usr/local/etc/stunnel;

./generate-key.sh;

chmod 600 ca.crt redis.crt redis.key;

redis-server /usr/local/etc/redis/redis.conf;
stunnel4 /usr/local/etc/stunnel/stunnel.conf;
