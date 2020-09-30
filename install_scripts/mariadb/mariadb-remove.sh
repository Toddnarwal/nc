#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker stop mariadb

echo ''
echo 'STEP 1'
sudo docker rm mariadb

echo ''
echo 'STEP 2'
sudo docker volume prune -f

