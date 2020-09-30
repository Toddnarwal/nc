#!/bin/bash

for file in *.yml; do sed 's/\$/\$\$/g' -i $file;
docker-compose -f $file up --force-recreate -d; done

