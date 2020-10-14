#!/bin/bash

#
# Restrict onlyoffice to nextcloud instance
#

docker exec -it onlyoffice sed -i 's/"rules": \[{"address": "\*"/"rules": \[{"address": "<nextcloud.server.com>"/g' /etc/onlyoffice/documentserver/default.json

docker exec -it onlyoffice  supervisorctl restart all
