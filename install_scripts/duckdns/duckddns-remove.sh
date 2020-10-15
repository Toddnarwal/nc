#!/bin/bash

docker stop duckdns
docker rm duckdns
docker volume prune -f
