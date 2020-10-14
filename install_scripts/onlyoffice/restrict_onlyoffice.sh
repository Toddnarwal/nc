#!/bin/bash

#
# Restrict onlyoffice to nextcloud instance
#

docker exec -it onlyoffice sed -i 's/"rules": \[{"address": "\*", "allowed": true}\],/"rules": \[{"address": "<nextcloud.server.com>", "allowed": true}\],/g' /etc/onlyoffice/documentserver/default.json

supervisorctl restart all
