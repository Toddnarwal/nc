#!/bin/bash

docker volume create nextcloud_config
docker volume create nextcloud_data 

docker run \
  --name=nextcloud \
  --env-file="../env" \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 4443:443 \
  -v nextcloud_config:/config \
  -v nextcloud_data:/data \
  -v dropbox_data:/Dropbox \
  --restart always \
  linuxserver/nextcloud

docker network connect mariadb nextcloud
