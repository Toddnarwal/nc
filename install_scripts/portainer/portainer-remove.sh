#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker stop portainer-ce
echo ''
echo 'STEP 1'
sudo docker rm portainer-ce
echo ''
echo 'STEP 2'
sudo docker volume prune -f


