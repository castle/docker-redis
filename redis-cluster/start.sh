#!/bin/bash

set -e

cd /usr/local/etc/redis-cluster;

ports=(6381 6382 6383 6384 6385 6386)

for port in "${ports[@]}"; do
    cd "$port" && redis-server ./redis.conf && cd - >/dev/null;
done

echo "yes" | redis-cli --cluster create 127.0.0.1:6381 127.0.0.1:6382 127.0.0.1:6383 127.0.0.1:6384 127.0.0.1:6385 127.0.0.1:6386 --cluster-replicas 1;

while true; do sleep 60; done
