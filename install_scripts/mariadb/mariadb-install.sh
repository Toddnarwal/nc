#!/bin/bash

docker network create mariadb
docker volume create mariadb_config
docker run \
  --name=mariadb \
  --net=mariadb \
  --env-file="../env" \
  -v mariadb_config:/config \
  --restart always \
  linuxserver/mariadb
