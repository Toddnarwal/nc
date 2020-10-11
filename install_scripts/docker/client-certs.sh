#!/bin/bash

#
# Create client certs to connect to remote docker server port
#

openssl genrsa -out key.pem 4096
openssl req -subj '/CN=client' -new -key key.pem -out client.csr
echo extendedKeyUsage = clientAuth > extfile-client.cnf

# Copy ca.pem and ca-key.pem are generated after running secure-server-admin-port.sh
openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out cert.pem -extfile extfile-client.cnf

# Use cert.pem and key.pem to configure portainer endpoint
# https://lemariva.com/blog/2019/12/portainer-managing-docker-engine-remotely
