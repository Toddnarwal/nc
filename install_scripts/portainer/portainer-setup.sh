#!/bin/bash

#
# Create SSL certs for HTTPS access to Portainer
#
mkdir local-certs && cd local-certs
openssl genrsa -out portainer.key 2048
openssl ecparam -genkey -name secp384r1 -out portainer.key
openssl req -new -x509 -sha256 -key portainer.key -out portainer.crt -days 3650

#
# Create SSL certs to access to remote Docker port
#
openssl genrsa -out docker-key.pem 4096
openssl req -subj '/CN=client' -new -key docker-key.pem -out client.csr
echo extendedKeyUsage = clientAuth > extfile-client.cnf

# ca.pem and ca-key.pem are generated after running docker-setup.sh
# Copy ca.pem and ca-key.pem from remote docker server
openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out docker-cert.pem -extfile extfile-client.cnf
# docker-cert.pem and docker-key.pem are used to configure remote docker access from Portainer GUI
# https://lemariva.com/blog/2019/12/portainer-managing-docker-engine-remotely

#
# Clean up
#
rm extfile-client.cnf client.csr

# Installing Portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9000 --name=portainer-ce \
 --restart=always -v ~/local-certs:/certs -v portainer_data:/data \
 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce \
 --ssl --sslcert /certs/portainer.crt --sslkey /certs/portainer.key \
