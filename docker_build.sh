#!/bin/sh -eu

cd docker
docker build -t linux_build:latest .

docker volume inspect linux-vol 2&>1 > /dev/null
if [ $? -eq 1 ];
  docker volume create linux-vol > /dev/null
fi
