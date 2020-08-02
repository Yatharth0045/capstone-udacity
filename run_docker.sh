#!/usr/bin/env bash

## Repo and Tag name
REPO="yatharth0045"
TAG="my-application:latest"

## Build image
docker build -t ${TAG} .

# List docker images
docker images | grep ${TAG}

# Tag Docker Image with the docker repo
docker tag ${TAG} ${REPO}/${TAG}

#Push Docker image to docker hub
docker push ${REPO}/${TAG}

# Run the docker container
# docker run -d -p 80:80 ${TAG}
