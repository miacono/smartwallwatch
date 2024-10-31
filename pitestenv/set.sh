#!/bin/sh

# This script sets a raspbian image for being used as emulator with Qemu
# 
# The password for "pi" user is "password"
#
# Requires 2023-05-03-raspios-bullseye-armhf-lite.img to be in the ./imgs/ directory

scp ./imgs/2023-05-03-raspios-bullseye-armhf-lite.img ./imgs/raspbian.img
qemu-img resize ./imgs/raspbian.img +6G

mkdir -p /mnt/raspbian
mount ./imgs/raspbian.img -o offset=272629760 /mnt/raspbian/

sed -i -e 's/pi\:\*\:/pi\:$6$3gqSVaPVBATJy0rm$IKthclIH9c8B95yebnbJsUFI0y0p6FiYGcwRZxOl8E6r10liMJBu5h05AGn85iXLi1sagd3WVfJ.YJYNUE.26.\:/g' /mnt/raspbian/etc/shadow
sed -i -e 's/\/usr\/lib/#\/usr\/lib/g' /mnt/raspbian/etc/ld.so.preload

umount /mnt/raspbian

chown matteo:matteo ./imgs/raspbian.img
