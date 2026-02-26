#!/bin/bash

export CROSS_COMPILE=${HOME}/toolchains/gcc/bin/aarch64-linux-androidkernel-
export CC=${HOME}/toolchains/clang-r383902b1/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y a22_defconfig ksu.config nomount.config
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j16

cp out/arch/arm64/boot/Image /mnt/hgfs/Firm/Image
