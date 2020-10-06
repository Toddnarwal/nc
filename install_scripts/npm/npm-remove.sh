#!/bin/bash

echo ''
echo 'STEP 0'
docker stop nginx-proxy-manager

echo ''
echo 'STEP 1'
docker rm nginx-proxy-manager

echo ''
echo 'STEP 2'
docker volume prune -f
