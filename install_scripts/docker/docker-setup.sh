#!/bin/bash

#
# Create certs to secure docker port for remote management
# 

export HOST=<your-domain-name>
mkdir -p ~/.certs

openssl genrsa -aes256 -out ~/.certs/ca-key.pem 4096
# enter a pass phrase to protect the ca-key

openssl req -new -x509 -days 365 -key ~/.certs/ca-key.pem -sha256 \
 -out ~/.certs/ca.pem -subj "/C=/ST=/L=/O=/CN=$HOST"
# enter a pass phrase to create ca.pem

openssl genrsa -out ~/.certs/server-key.pem 4096
openssl req -subj "/CN=$HOST" -sha256 -new -key ~/.certs/server-key.pem \
 -out server.csr
echo subjectAltName = DNS:$HOST,IP:127.0.0.1 >> extfile.cnf
echo extendedKeyUsage = serverAuth >> extfile.cnf
openssl x509 -req -days 365 -sha256 -in server.csr -CA ~/.certs/ca.pem \
 -CAkey ~/.certs/ca-key.pem -CAcreateserial -out ~/.certs/server-cert.pem \
 -extfile extfile.cnf
# enter a pass phrase to create server-cert.pem

#
# Clean up
#
chmod -v 0400  ~/.certs/ca-key.pem  ~/.certs/server-key.pem
chmod -v 0444  ~/.certs/ca.pem  ~/.certs/server-cert.pem
rm extfile.cnf server.csr ~/.certs/ca.srl

#
# Override docker startup options
#

mkdir -p /etc/systemd/system/docker.service.d/

echo # /etc/systemd/system/docker.service.d/override.conf > startup_options.conf
echo [Service] >> startup_options.conf
echo ExecStart= >> startup_options.conf
echo ExecStart=/usr/bin/dockerd --tlsverify --tlscacert=$HOME/.certs/ca.pem \
 --tlscert=$HOME/.certs/server-cert.pem --tlskey=$HOME/.certs/server-key.pem \
  -H fd:// -H tcp://0.0.0.0:2376 >> startup_options.conf
cp startup_options.conf /etc/systemd/system/docker.service.d/startup_options.conf

#
# Install docker
#

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#
# Install docker-compose
#

curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo  chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
newgrp docker 

#
# Restart Docker (my not be needed)
#
 
sudo systemctl daemon-reload
sudo systemctl restart docker.service
