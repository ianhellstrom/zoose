#!/bin/bash

source .env
for dir in *; do
  if [ -d "${dir}" ]; then
  	if [ "${dir}" != "gitpod" ]; then
      docker tag  "${PREFIX}-${dir}" "${PREFIX}-${dir}:dev-${TAG}"
      docker push "${PREFIX}-${dir}:dev-${TAG}"
    else
      docker tag  "${PREFIX}-base-${dir}" "${PREFIX}-base-${dir}:dev-${TAG}"
      docker push "${PREFIX}-base-${dir}:dev-${TAG}"
      docker tag  "${PREFIX}-quantum-${dir}" "${PREFIX}-quantum-${dir}:dev-${TAG}"
      docker push "${PREFIX}-quantum-${dir}:dev-${TAG}"
    fi
  fi
done
