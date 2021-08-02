#!/bin/bash
source conf.sh
docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):$(pwd):consistent \
  -w /app/$(pwd) \
  -p 8888:8888 \
  -p 7473:7373 \
  -p 7474:7474 \
  -p 7687:7687 \
  "$DOCKER_IMAGE"
