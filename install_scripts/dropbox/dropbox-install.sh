#!/bin/bash

docker run --detach --name=dropbox --restart=always \
  -e DROPBOX_UID=$(id -u) -e DROPBOX_GID=$(id -g) \
  -v "$HOME:/opt/dropbox/.dropbox" \
  -v "$HOME:/opt/dropbox/Dropbox" \
  otherguy/dropbox:latest
  
# Check logs for dropbox url to allow access
