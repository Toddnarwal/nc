#!/bin/bash

echo ''
echo 'STEP 0'
docker volume create duckdns-tdouble_config

echo ''
echo 'STEP 1'
docker create \
  --name=duckdns-tdouble \
  --env-file="../env" \
  -v duckdns-tdouble_config:/config  \
  --restart unless-stopped \
  linuxserver/duckdns
