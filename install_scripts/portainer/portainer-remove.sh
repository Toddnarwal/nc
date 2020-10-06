#!/bin/bash

echo ''
echo 'STEP 0'
docker stop portainer-ce
echo ''
echo 'STEP 1'
docker rm portainer-ce
echo ''
echo 'STEP 2'
docker volume prune -f


