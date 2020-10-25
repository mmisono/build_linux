#!/bin/sh -eu

cd /linux/
set +e
git clone https://github.com/torvalds/linux
set -e
mkdir -p linux/build
cd linux
cp /share/config/config_5.9_mini ./build/.config
make O=./build olddefconfig
bear make O=./build bzImage -j$(nproc)
mkdir -p /share/build
cp ./build/arch/x86/boot/bzImage /share/build/
cp ./build/vmlinux /share/build/
