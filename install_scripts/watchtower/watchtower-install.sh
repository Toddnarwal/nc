#!/bin/bash

# Don't update onlyoffice
docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc/timezone:/etc/timezone:ro  \
    containrrr/watchtower  nextcloud dropbox mariadb \
    nginx-proxy-manager cloudflare-nextcloud cloudflare-npm \
    cloudflare-onlyoffice duckdns-gcpdocserver --cleanup 
