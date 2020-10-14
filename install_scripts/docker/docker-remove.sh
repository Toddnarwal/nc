#!/bin/bash

sudo systemctl stop docker.service
sudo rm /etc/systemd/system/docker.service.d/startup_options.conf
sudo rm /usr/local/bin/docker-compose
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo rm -rf /var/lib/docker/
sudo rm -rf ~/.certs
