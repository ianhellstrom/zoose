#!/bin/bash
docker run --pull always --rm -i \
  -v hadolint.yaml:/.config/hadolint.yaml \
  hadolint/hadolint < docker/Dockerfile
