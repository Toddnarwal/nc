#!/bin/bash

docker volume create onlyoffice_data
docker volume create onlyoffice_custom
docker volume create onlyoffice_lib
docker volume create onlyoffice_postgresql
docker volume create onlyoffice_rabbitmq
docker volume create onlyoffice_redis
docker volume create onlyoffice_log

docker run -i -t -d --restart=always --name onlyoffice -p 8443:443 \
  -v onlyoffice_data:/var/www/onlyoffice/Data \
  -v onlyoffice_custom:/usr/share/fonts/truetype/custom \
  -v onlyoffice_lib:/var/lib/onlyoffice \
  -v onlyoffice_postgresql:/var/lib/postgresql \
  -v onlyoffice_rabbitmq:/var/lib/rabbitmq \
  -v onlyoffice_redis:/var/lib/redis \
  -v onlyoffice_log:/var/log/onlyoffice \
  onlyoffice/documentserver:5.4.2.46

docker exec -it onlyoffice openssl genrsa -out onlyoffice.key 2048
docker exec -it onlyoffice openssl req -new -key onlyoffice.key -out onlyoffice.csr -subj "/C=/ST=/L=/O=/CN=onlyoffice ssl"
docker exec -it onlyoffice openssl x509 -req -days 365 -in onlyoffice.csr -signkey onlyoffice.key -out onlyoffice.crt
docker exec -it onlyoffice openssl dhparam -out dhparam.pem 2048

docker exec -it onlyoffice mkdir -p /var/www/onlyoffice/Data/certs
docker exec -it onlyoffice mv onlyoffice.key /var/www/onlyoffice/Data/certs/
docker exec -it onlyoffice mv onlyoffice.crt /var/www/onlyoffice/Data/certs/
docker exec -it onlyoffice mv dhparam.pem /var/www/onlyoffice/Data/certs/

docker restart onlyoffice
