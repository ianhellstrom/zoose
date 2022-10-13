#!/bin/bash
mkdir reqs

cp base/requirements.in reqs/requirements.in
cp quantum/requirements.in reqs/quantum.in

docker run --pull always --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/requirements.in \
    --upgrade --no-allow-unsafe \
    --strip-extras --no-header
    
docker run --pull always --rm -it \
  -v $(pwd):/app -w /app \
  databaseline/pip-compile /app/reqs/quantum.in \
    --upgrade --no-allow-unsafe \
    --strip-extras --no-header

mv reqs/requirements.txt base/requirements.txt
mv  reqs/quantum.txt quantum/requirements.txt

rm -rf reqs
