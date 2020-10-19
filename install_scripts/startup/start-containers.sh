#!/bin/bash

# Copy start-containers.sh to /usr/local/bin and chmod +x /usr/local/bin/start-containers.sh

sleep 1m
docker start onlyoffice

sleep 5m
docker start mariadb

sleep 1m
docker start dropbox

sleep 1m
docker start nextcloud
