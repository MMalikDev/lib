#!/bin/bash

# Turn on bash's job control
set -m

# Start docker service in background
/usr/local/bin/dockerd-entrypoint.sh &

# Wait that the docker service is up
while ! docker info; do
  echo "Waiting docker..."
  sleep 3
done

# Import pre-installed images
for file in /images/*.tar; do
  docker load <$file
done

# Bring docker service back to foreground
fg %1

# So the Dockerfile will be :
# ARG DIND_VERSION=24.0-dind-rootless
# FROM docker:${DIND_VERSION} as builder
 
# RUN apk add --update --no-cache bash tini
 
# COPY ./images /images
# COPY ./entrypoint.sh /entrypoint.sh
 
# ENTRYPOINT ["tini", "--", "/entrypoint.sh"]

# FYI, an example on how to save an image :
# docker pull python
# docker save python > images/python.tar