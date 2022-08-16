#!/bin/bash
for dir in *; do
  if [ -d "${dir}" ]; then
    echo "${dir}"
    docker run --pull always --rm -i \
      -v $(pwd)/hadolint.yaml:/.config/hadolint.yaml \
      hadolint/hadolint < ${dir}/Dockerfile
  fi
done
