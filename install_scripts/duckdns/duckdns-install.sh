#!/bin/bash

docker volume create duckdns
docker create \
  --name=duckdns \
  --env-file="../env" \
  -v duckdns:/config  \
  --restart always \
  linuxserver/duckdns
