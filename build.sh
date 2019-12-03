#!/usr/bin/env bash

# Login to Docker
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

# Iterate over containers
CONTAINERS=`find ./containers -mindepth 1 -maxdepth 1 -type d`
for CONTAINER in $CONTAINERS; do
  # Build image
  docker build -t ${DOCKER_USERNAME}/${CONTAINER##*/} $CONTAINER

  # Tag image and upload to Dockerhub
  docker tag ${DOCKER_USERNAME}/${CONTAINER##*/} ${DOCKER_USERNAME}/${IMAGE}:latest
  docker push ${DOCKER_USERNAME}/${CONTAINER##*/}:latest
done
