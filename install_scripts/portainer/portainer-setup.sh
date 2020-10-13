#!/bin/bash

# Create SSL certs for HTTPS
mkdir local-certs && cd local-certs
openssl genrsa -out portainer.key 2048
openssl ecparam -genkey -name secp384r1 -out portainer.key
openssl req -new -x509 -sha256 -key portainer.key -out portainer.crt -days 3650

# Installing Portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9000 --name=portainer-ce --restart=always -v ~/local-certs:/certs -v portainer_data:/data -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce --ssl --sslcert /certs/portainer.crt --sslkey /certs/portainer.key
