#!/bin/bash
source conf.sh
docker push "$DOCKER_IMAGE"

docker tag "$DOCKER_IMAGE" "${ZOOSE_IMAGE}:latest"
docker push "${ZOOSE_IMAGE}:latest"
