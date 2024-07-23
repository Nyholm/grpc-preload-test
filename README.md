# GRPC with PHP preloading

This repository will show a bug with GRPC and PHP preloading.

## How to reproduce

```bash
# Terminal 1 (server)
docker-compose up --build
```

When you've built the containers (took me 10 minutes), then run:
```bash
# Terminal 2 (client)
./make-requests.sh
```

See both terminals for the output.

## Configuration

PHP-FPM is configured to have 2 threads and they will serve 3 request each.
If the thread fails to restart, then the client can consume 2 x 3 = 6 requests. The
7th request will timeout.

See `php/php.ini` at the very bottom of the file to enable `opcache.preload`
and `grpc.enable_fork_support`.
