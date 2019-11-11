FROM golang:1.13-buster as builder
WORKDIR /app
RUN git clone -b v2 "https://github.com/caddyserver/caddy.git" && \
    cd caddy/cmd/caddy/ && \
    CGO_ENABLED=0 go build

FROM debian:buster-slim
COPY --from=builder /app/caddy/cmd/caddy/caddy /usr/bin/
WORKDIR /app
ENV LISTEN_HOST=:2015
CMD caddy file-server -browse -listen ${LISTEN_HOST}

# examples:
# docker build -t caddy -t aaronmsft/hello-caddy -t aaronmsft/hello-caddy:2 .
# docker login
# docker push aaronmsft/hello-caddy
# docker run -p 80:80 --env LISTEN_HOST=:80 --rm -it aaronmsft/hello-caddy
# docker run -p 2015:2015 --rm -it aaronmsft/hello-caddy
# docker run -p 2015:2015 --rm -it aaronmsft/hello-caddy bash
