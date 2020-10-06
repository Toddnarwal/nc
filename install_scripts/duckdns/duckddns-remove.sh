#!/bin/bash

echo ''
echo 'STEP 0'
docker stop duckdns-tdouble

echo ''
echo 'STEP 1'
docker rm duckdns-tdouble

echo ''
echo 'STEP 2'
docker volume prune -f

