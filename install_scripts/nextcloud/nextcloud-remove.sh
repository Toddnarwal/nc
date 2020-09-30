#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker stop nextcloud

echo ''
echo 'STEP 1'
sudo docker rm nextcloud

echo ''
echo 'STEP 2'
sudo docker volume prune -f

