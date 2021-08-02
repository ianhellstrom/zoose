#!/bin/bash
DOCKER_IMAGE="databaseline/zoose:0.0.1"
docker build -t "$DOCKER_IMAGE" docker
docker push "$DOCKER_IMAGE"
