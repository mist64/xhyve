#!/bin/bash
KERNEL="vmlinuz"
INITRD="initrd.img"
CMDLINE="earlyprintk=serial console=ttyS0 acpi=off sshd=1"
MEM="-m 1G"
NET="-s 2:0,virtio-net"
IMG_CD="-s 3,ahci-cd,CentOS-7-x86_64-Minimal-1810.iso"
IMG_HDD="-s 4,virtio-blk,hdd.img"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"
xhyve $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD -f kexec,$KERNEL,$INITRD,"$CMDLINE"