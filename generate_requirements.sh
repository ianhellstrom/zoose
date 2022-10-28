#!/bin/bash
mkdir reqs

cp base/requirements.in reqs/requirements.in
cp pytorch/requirements.in reqs/pytorch.in
cp quantum/requirements.in reqs/quantum.in

docker run --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/requirements.in \
    --upgrade --no-allow-unsafe \
    --strip-extras --no-header

docker run --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/pytorch.in \
    --upgrade --no-allow-unsafe \
    --strip-extras --no-header
    
docker run --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/quantum.in \
    --upgrade --no-allow-unsafe \
    --strip-extras --no-header ]
    --unsafe-package cirq openfermion

mv reqs/requirements.txt base/requirements.txt
mv reqs/pytorch.txt pytorch/requirements.txt
mv reqs/quantum.txt quantum/requirements.txt

rm -rf reqs
