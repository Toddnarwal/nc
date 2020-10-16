#!/bin/bash

docker stop mariadb
docker rm mariadb
docker volume prune -f
