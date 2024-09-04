#!/bin/bash
mkdir reqs

cp base/constraints.txt reqs/constraints.txt
cp base/requirements.in reqs/requirements.in
cp pytorch/requirements.in reqs/pytorch.in
cp quantum/requirements.in reqs/quantum.in
cp geo/requirements.in reqs/geo.in


docker run --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/requirements.in \
    --upgrade --no-allow-unsafe \
    --strip-extras --no-header \
    --resolver=backtracking

docker run --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/pytorch.in \
    --upgrade --no-allow-unsafe \
    --strip-extras --no-header \
    --resolver=backtracking
  
docker run --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/quantum.in \
    --upgrade --allow-unsafe \
    --strip-extras --no-header \
    --resolver=backtracking

docker run --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/geo.in \
    --upgrade --allow-unsafe \
    --strip-extras --no-header \
    --resolver=backtracking

mv reqs/requirements.txt base/requirements.txt
mv reqs/pytorch.txt pytorch/requirements.txt
mv reqs/quantum.txt quantum/requirements.txt
mv reqs/geo.txt geo/requirements.txt

rm -rf reqs
