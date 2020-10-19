#!/bin/bash

#
# Restrict onlyoffice to nextcloud instance
#

docker exec -it onlyoffice sed -i 's/"string": "secret"/"string": "supersecretpassword"/g' /etc/onlyoffice/documentserver/default.json
docker exec -it onlyoffice sed -i 's/"browser": false/"browser": true/g' /etc/onlyoffice/documentserver/default.json
docker exec -it onlyoffice sed -i 's/"inbox": false/"inbox": true/g' /etc/onlyoffice/documentserver/default.json
docker exec -it onlyoffice sed -i 's/"outbox": false/"outbox": true/g' /etc/onlyoffice/documentserver/default.json
docker exec -it onlyoffice sed -i 's/false/true/g' /etc/onlyoffice/documentserver/local.json

# Choose Secret key to be used in Nextcloud GUI for Onlyoffice configuration
docker exec -it onlyoffice sed -i 's/"secret"/"supersecretpassword"/g' /etc/onlyoffice/documentserver/local.json

docker exec -it onlyoffice  supervisorctl restart all
