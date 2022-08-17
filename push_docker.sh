#!/bin/bash
docker compose push

source .env
for dir in *; do
  if [ -d "${dir}" ]; then
  	if [ "${dir}" != "r" ]; then
      docker tag "${PREFIX}-${dir}" "${PREFIX}-${dir}:latest"
      docker push "${PREFIX}-${dir}:latest"
    fi
  fi
done
