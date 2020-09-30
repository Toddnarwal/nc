#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker network create mariadb

echo ''
echo 'STEP 1'
sudo docker volume create mariadb_config

echo ''
echo 'STEP 2'

docker create \
  --name=mariadb \
  --net=mariadb \
  --env-file="../env" \
  -v mariadb_config:/config \
  --restart always \
  linuxserver/mariadb
