#!/bin/bash
source conf.sh
docker build --build-arg zoose_version=$ZOOSE_TAG -t "$DOCKER_IMAGE" docker

docker-compose up --build --detach
docker-compose logs --tail 25
docker compose down