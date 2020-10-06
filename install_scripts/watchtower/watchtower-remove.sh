#!/bin/bash

echo ''
echo 'STEP 0'
docker stop watchtower

echo ''
echo 'STEP 1'
docker rm watchtower
