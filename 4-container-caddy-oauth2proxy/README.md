# README

build locally:
```bash
git clone -b v2 "https://github.com/caddyserver/caddy.git"
cd caddy/cmd/caddy/
go build
```

or via docker:
[Dockerfile](Dockerfile)

run caddy locally:
```bash
# start and block
./caddy run

# start in background
./caddy start

# stop
./caddy stop

# basic configuration
./caddy start --config caddy.json

# advanced configuration
./caddy start --config caddy-advanced.json
```

dynamic configuration:
```bash
curl -X POST "http://localhost:2019/load" \
    -H "Content-Type: application/json" \
    -d @- << EOF
    {
        "apps": {
            "http": {
                "servers": {
                    "example": {
                        "listen": ["127.0.0.1:2080"],
                        "routes": [
                            {
                                "handle": [{
                                    "handler": "file_server",
                                    "browse": {}
                                }]
                            }
                        ]
                    }
                }
            }
        }
    }
EOF
```

dynamic configuration (from file):
```bash
curl -X POST "http://localhost:2019/load" \
    -H "Content-Type: application/json" \
    -d @caddy.json
```

## Resources
- https://github.com/caddyserver/caddy/tree/v2#quick-start
- https://github.com/caddyserver/caddy/wiki/v2:-Documentation
