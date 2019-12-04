#!/usr/bin/env bash

# Load env if running locally
[[ -z "$TRAVIS_CI" ]] && source .env

# Login to Docker
echo "${DOCKER_PASSWORD}" | docker login --username "${DOCKER_USERNAME}" --password-stdin

# Iterate over containers
CONTAINERS=`find ./containers -mindepth 1 -maxdepth 1 -type d`
for CONTAINER in $CONTAINERS; do

  REPO="${DOCKER_USERNAME}/${CONTAINER##*/}"
  echo $REPO

  # Build image
  docker build -t $REPO $CONTAINER

  # Tag image and upload to Dockerhub
  docker tag $REPO $REPO:latest
  docker push $REPO:latest
done