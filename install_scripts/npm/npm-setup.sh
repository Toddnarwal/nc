#!/bin/bash

docker volume create npm_config
docker run -d \
    --name=nginx-proxy-manager \
    -p 8181:8181 \
    -p 80:8080 \
    -p 443:4443 \
    -v npm_config:/config:rw \
    jlesage/nginx-proxy-manager
