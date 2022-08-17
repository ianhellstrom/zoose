#!/bin/bash
# Usage:           ./zoose.sh [FLAVOUR]
# FLAVOUR options: base neo4j quantum r
# FLAVOUR default: base
# Example:         ./zoose.sh neo4j
source .env
FLAVOUR="${1:-base}"
IMAGE="${PREFIX}-$FLAVOUR:${TAG}"

echo "Launching ${IMAGE}..."

if [ "$FLAVOUR" = "neo4j" ]; then
  docker run --rm -it \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    -p 8888:8888 \
    -p 7473:7373 \
    -p 7474:7474 \
    -p 7687:7687 \
    "${IMAGE}"
else
  docker run --rm -it \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    -p 8888:8888 \
    "${IMAGE}"
fi
