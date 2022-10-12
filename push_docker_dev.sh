#!/bin/bash

source .env
for dir in *; do
  if [ -d "${dir}" ]; then
  	if [ "${dir}" != "gitpod" ]; then
      docker tag  "${PREFIX}-${dir}:${TAG}" "${PREFIX}-${dir}:dev-only"
      docker push "${PREFIX}-${dir}:dev-only"
    else
      docker tag  "${PREFIX}-base-${dir}:${TAG}" "${PREFIX}-base-${dir}:dev-only"
      docker push "${PREFIX}-base-${dir}:dev-only"
      docker tag  "${PREFIX}-quantum-${dir}:${TAG}" "${PREFIX}-quantum-${dir}:dev-only"
      docker push "${PREFIX}-quantum-${dir}:dev-only"
    fi
  fi
done
