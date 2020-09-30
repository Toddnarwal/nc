#!/bin/bash

echo ''
echo 'STEP 0'
sudo docker stop watchtower

echo ''
echo 'STEP 1'
sudo docker rm watchtower
