#!/bin/bash

source .env
for dir in *; do
  if [ -d "${dir}" ]; then
  	if [ "${dir}" != "gitpod" ]; then
      docker tag  "${PREFIX}-${dir}:${TAG}" "${PREFIX}-${dir}:dev-${TAG}"
      docker push "${PREFIX}-${dir}:dev-${TAG}"
    else
      docker tag  "${PREFIX}-base-${dir}:${TAG}" "${PREFIX}-base-${dir}:dev-${TAG}"
      docker push "${PREFIX}-base-${dir}:dev-${TAG}"
      docker tag  "${PREFIX}-quantum-${dir}:${TAG}" "${PREFIX}-quantum-${dir}:dev-${TAG}"
      docker push "${PREFIX}-quantum-${dir}:dev-${TAG}"
    fi
  fi
done
