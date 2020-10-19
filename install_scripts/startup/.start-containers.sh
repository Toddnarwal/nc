#!/bin/bash

sleep 1m
docker start onlyoffice

sleep 5m
docker start mariadb

sleep 1m
docker start dropbox

sleep 1m
docker start nextcloud
