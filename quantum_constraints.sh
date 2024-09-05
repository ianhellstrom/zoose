#!/bin/bash
# This script concatenates the base and quantum requirements and generates a single requirements file
# Why? Quantum libraries can often lead to version conflicts that are hard to fix when running one after the other
# This script generates a single requirements file with all versions pegged, which can be used to generate constraints

mkdir reqs

# Concatenate both requirements files while skipping the first two lines (that contain constraints)
{ tail -n +3 base/requirements.in && tail -n +3 quantum/requirements.in; } | sort > reqs/quantum.in

docker run --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/quantum.in \
    --upgrade --no-allow-unsafe \
    --strip-extras --no-header \
    --resolver=backtracking

mv reqs/quantum.txt quantum/requirements.txt

rm -rf reqs
