#!/bin/bash
echo ''
echo 'STEP 0'
sudo rm /usr/local/bin/docker-compose
echo ''
echo 'STEP 1'
sudo apt-get remove -y docker docker-engine docker.io containerd runc
echo ''
echo 'STEP 2'
sudo rm -rf /var/lib/docker/

