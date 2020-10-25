#/bin/sh -eu

IMAGE=${IMAGE:-./share/vm/buster.img}
KERNEL=${KERNEL:-./share/build/bzImage}
SHAREDIR=${SHAREDIRE:-./share}
QEMU=${QEMU:-qemu-system-x86_64}

sudo $QEMU \
-drive file=$IMAGE,format=raw \
-net user,host=10.0.2.10,hostfwd=tcp::10022-:22 \
-net nic \
-nographic \
-kernel $KERNEL \
-append "console=ttyS0 root=/dev/sda earlyprintk=serial slub_debug=UZ vsyscall=native rodata=n net.ifnames=0 noinitrd" \
-pidfile vm_pid \
-m 2G \
-smp 1 \
-accel kvm \
-cpu host \
-virtfs local,path=./share,mount_tag=share,security_model=none
