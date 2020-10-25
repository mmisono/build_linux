#!/bin/sh -eu

# Apparently mounting in the container requires --priviledged
# TODO: restrict permission
docker run --privileged=true \
           -v $PWD/share:/share \
           --mount source=linux-vol,target=/linux \
           --rm -it linux_build
