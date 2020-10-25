#!/bin/sh -eu

DEPTH=${DEPTH:-}

if [ -z ${DEPTH+x} ];
  git clone https://github.com/torvalds/linux
else
  git clone https://github.com/torvalds/linux --depth $DEPTH
fi

