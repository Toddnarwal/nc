#!/bin/bash

# Don't update onlyoffice
docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v TZ:America/Los_Angeles  \
    containrrr/watchtower  cloudflare-nextcloud \
    cloudflare-npm  cloudflare-onlyoffice  \ 
    nextcloud  dropbox  duckdns-gcpdocserver  \ 
    mariadb  nginx-proxy-manager  --cleanup 
