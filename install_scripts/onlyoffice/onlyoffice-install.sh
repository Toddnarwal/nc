#!/bin/bash

docker volume create onlyoffice_data
docker volume create onlyoffice_custom
docker volume create onlyoffice_lib
docker volume create onlyoffice_postgresql
docker volume create onlyoffice_rabbitmq
docker volume create onlyoffice_redis
docker volume create onlyoffice_log

sudo docker run -i -t -d --restart=always --name onlyoffice -p 8080:80 \
  -v onlyoffice_data:/var/www/onlyoffice/Data \
  -v onlyoffice_custom:/usr/share/fonts/truetype/custom \
  -v onlyoffice_lib:/var/lib/onlyoffice \
  -v onlyoffice_postgresql:/var/lib/postgresql \
  -v onlyoffice_rabbitmq:/var/lib/rabbitmq \
  -v onlyoffice_redis:/var/lib/redis \
  -v onlyoffice_log:/var/log/onlyoffice \
  onlyoffice/documentserver:5.4.2.46
