#!/bin/sh

docker build \
  --file ./tools/BinaryBuilder.Dockerfile \
  --tag sqlite-builder \
  --no-cache \
  --build-arg NODE_VERSION=24.14.1 \
  --build-arg VARIANT=bullseye \
  .

CONTAINER_ID=$(docker create -it sqlite-builder)
docker cp $CONTAINER_ID:/usr/src/build/prebuilds/ ./prebuilds
