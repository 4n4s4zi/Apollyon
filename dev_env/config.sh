#!/bin/sh
#set -xe
#***Loads VM options used by install/run scripts***

ISO_NAME="TempleOS.ISO"
ISO_URL="https://templeos.org/Downloads/TempleOS.ISO"
IMG_NAME="tos.img"
IMG_SIZE="1G"
MEM="1G"
CPU="1"
QEMU_CMD="qemu-system-x86_64"
QEMU_FLAGS=" \
-enable-kvm \
-m $MEM \
-smp $CPU \
-cdrom $ISO_NAME"
