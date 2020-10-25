Build Linux and run it with QEMU
================================

This repository contains scripts for building Linux and booting it with QEMU.
The scripts not only build a kernel but also create a disk image using
debootstrap. The scripts works on both Linux and Mac. To support Mac, building
Linux is done in a container.

## Requirements
- Docker
- QEMU
- [Haxm](https://github.com/intel/haxm) (Optional)

## How to build
```
./docker_build.sh
./linux_build.sh
```

## How to run
- ./qemu_run.sh
    - Run VM with QEMU without any hardware acceleration
- ./qemu_hvf_haxm.sh
    - Run VM with QEMU with HyperVisor Framework (for mac)
    - I encountered kernel oops during boot for some reasons
- ./run_haxm_qemu.sh
    - Run VM with QEMU with Haxm
    - I don't test it yet
    - Theoretically it should work both on Mac and Linux
- ./run_kvm_qemu.sh
    - Run VM with QEMU with KVM (for Linux)

## Utils
- ./ssh.sh
    - ssh to a VM

## NOTE
- ./share is a share directory for both docker and VM
- Linux source is stored in a docker volume because Mac's file system is case
  insensitive by default and it causes a problem.
- ./docker/create-image.sh is taken from [syzkaller project](https://github.com/google/syzkaller/blob/master/tools/create-image.sh) and modified
- user/pass of a VM is root/root
