#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker volume create nextcloud_config
sudo docker volume create nextcloud_data 

echo ''
echo 'STEP 1'

docker create \
  --name=nextcloud \
  --net=mariadb \
  --env-file="../env" \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 4443:443 \
  -v nextcloud_config:/config \
  -v nextcloud_data:/data \
  --restart always \
  linuxserver/nextcloud

echo ''
echo 'STEP 2'
docker network connect bridge 
