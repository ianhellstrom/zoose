#!/bin/bash
source conf.sh
docker build -t "$DOCKER_IMAGE" docker
