#!/bin/bash

docker stop duckdns-tdouble
docker rm duckdns-tdouble
docker volume prune -f
