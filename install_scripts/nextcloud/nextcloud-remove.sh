#!/bin/bash

sudo docker stop nextcloud
sudo docker rm nextcloud
sudo docker volume prune -f
