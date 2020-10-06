#!/bin/bash

sudo rm /usr/local/bin/docker-compose
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo rm -rf /var/lib/docker/
