#!/bin/bash

sudo docker stop mariadb
sudo docker rm mariadb
sudo docker volume prune -f
