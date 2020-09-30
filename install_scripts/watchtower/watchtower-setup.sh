#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower --cleanup

