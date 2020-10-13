#!/bin/bash

docker stop portainer-ce
docker rm portainer-ce
docker volume prune -f
rm -rf ~/local-certs
