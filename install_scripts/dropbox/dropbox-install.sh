#!/bin/bash

# Use a local volume to share directory with Nextcloud
docker volume create dropbox_data

docker run --detach --name=dropbox --restart=always \
  -e DROPBOX_UID=$(id -u) -e DROPBOX_GID=$(id -g) \
  -v "$HOME:/opt/dropbox/.dropbox" \
  -v "dropbox_data:/opt/dropbox/Dropbox" \
  otherguy/dropbox:latest
  
# Check logs for dropbox url to allow access:  docker logs --follow dropbox
