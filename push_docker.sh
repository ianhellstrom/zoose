#!/bin/bash
docker compose push

source .env
for dir in *; do
  if [ -d "${dir}" ]; then
  	if [ "${dir}" != "gitpod" ]; then
      docker push "${PREFIX}-${dir}:${TAG}"
      docker tag  "${PREFIX}-${dir}:${TAG}" "${PREFIX}-${dir}:latest"
      docker push "${PREFIX}-${dir}:latest"
    else
      docker push  "${PREFIX}-base-${dir}:${TAG}"
      docker tag   "${PREFIX}-base-${dir}:${TAG}" "${PREFIX}-base-${dir}:latest"
      docker push  "${PREFIX}-base-${dir}:latest"
      docker push  "${PREFIX}-quantum-${dir}:${TAG}"
      docker tag   "${PREFIX}-quantum-${dir}:${TAG}" "${PREFIX}-quantum-${dir}:latest"
      docker push  "${PREFIX}-quantum-${dir}:latest"
    fi
  fi
done
