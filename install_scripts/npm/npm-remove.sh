#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker stop nginx-proxy-manager

echo ''
echo 'STEP 1'
sudo docker rm nginx-proxy-manager

echo ''
echo 'STEP 2'
sudo docker volume prune -f
