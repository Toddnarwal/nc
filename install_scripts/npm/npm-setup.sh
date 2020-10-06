#!/bin/bash

echo ''
echo 'STEP 0'
docker volume create npm_config

echo ''
echo 'STEP 1'
docker run -d \
    --name=nginx-proxy-manager \
    -p 8181:8181 \
    -p 80:8080 \
    -p 443:4443 \
    -v npm_config:/config:rw \
    jlesage/nginx-proxy-manager
