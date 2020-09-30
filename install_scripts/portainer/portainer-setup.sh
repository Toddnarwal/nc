#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker volume create portainer_data

echo ''
echo 'STEP 1'
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer-ce --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
