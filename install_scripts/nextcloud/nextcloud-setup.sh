#!/bin/bash

sudo docker volume create nextcloud_config
sudo docker volume create nextcloud_data 

docker create \
  --name=nextcloud \
  --env-file="../env" \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 4443:443 \
  -v nextcloud_config:/config \
  -v nextcloud_data:/data \
  --restart always \
  linuxserver/nextcloud

docker network connect mariadb nextcloud
