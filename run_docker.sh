#!/usr/bin/env bash

## Tag name
TAG="my-application:1.0.0"

## Build image
docker build -t ${TAG} .

# List docker images
docker images | grep ${TAG}

# Run the docker container
docker run -d -p 80:80 ${TAG}
