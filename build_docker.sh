#!/bin/bash
source conf.sh
docker build --build-arg zoose_version=$ZOOSE_TAG -t "$DOCKER_IMAGE" docker
