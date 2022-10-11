#!/bin/bash
docker compose push

source .env
for dir in *; do
  if [ -d "${dir}" ]; then
  	if [ "${dir}" != "gitpod" ]; then
      docker tag  "${PREFIX}-${dir}" "${PREFIX}-${dir}:latest"
      docker push "${PREFIX}-${dir}:latest"
    else
      docker tag  "${PREFIX}-base-${dir}" "${PREFIX}-base-${dir}:latest"
      docker push "${PREFIX}-base-${dir}:latest"
      docker tag  "${PREFIX}-quantum-${dir}" "${PREFIX}-quantum-${dir}:latest"
      docker push "${PREFIX}-quantum-${dir}:latest"
    fi
  fi
done
