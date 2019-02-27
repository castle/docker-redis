# redis-ssl

```
cd redis-ssl
make release VERSION=5.0.0 TAG=5.0.0
```

This will release `castle/redis:5.0.0-ssl` with Redis `5.0.0`.

To use cluster release:

```
docker run -e HOST=127.0.0.1 -p 6380:6380 --rm --name redis-ssl castle/redis:5.0.0-ssl
```


# redis-cluster

```
cd redis-cluster
make release VERSION=5.0.0 TAG=5.0.0
```

This will release `castle/redis:5.0.0-cluster` with Redis `5.0.0`.

To use cluster release:

```
docker run -p 6391:6391 -p 6392:6392 -p 6393:6393 --rm --name redis-cluster castle/redis:5.0.0-cluster
```

# redis-ssl-cluster

```
cd redis-cluster
make release VERSION=5.0.0 TAG=5.0.0
```

This will release `castle/redis:5.0.0-ssl-cluster` with Redis `5.0.0`.

To use cluster release:

```
docker run -p 6381:6381 -p 6382:6382 -p 6383:6383 --rm --name redis-cluster castle/redis:5.0.0-ssl-cluster
```
