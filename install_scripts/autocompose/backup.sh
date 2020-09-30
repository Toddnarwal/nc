#!/bin/bash

for image in $(docker ps --format '{{.Names}}'); do docker run --rm -v /var/run/docker.sock:/var/run/docker.sock red5d/docker-autocompose $image > ./yml/$image.yml; done

