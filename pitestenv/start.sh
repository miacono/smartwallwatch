#!/bin/sh

# This script starts a raspbian emulator
# 
# Requires the following files to be in the same directory:
# 
# * raspbian.img
# * kernel-qemu-5.10.63-bullseye
# * versatile-pb-bullseye-5.10.63.dtb

qemu-system-arm -kernel kernel-qemu-5.10.63-bullseye -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda raspbian.img -no-reboot -dtb versatile-pb-bullseye-5.10.63.dtb