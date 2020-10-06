#!/bin/bash

docker stop nginx-proxy-manager
docker rm nginx-proxy-manager
docker volume prune -f
