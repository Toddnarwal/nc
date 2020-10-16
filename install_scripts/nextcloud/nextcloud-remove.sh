#!/bin/bash

docker stop nextcloud
docker rm nextcloud
docker volume prune -f
