#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (Before Update feeds)
#
#
KERNELRELEASE=$(cat ./include/config/kernel.release)

# r8125 kernel module
# get the source 
#git clone https://github.com/awesometic/realtek-r8125-dkms.git 
#make -C . M=./realtek-r8125-dkms/src modules
# xz
#xz -z ./realtek-r8125-dkms/src/r8125.ko
#cp ./realtek-r8125-dkms/src/r8125.ko.xz /lib/modules/${KERNELRELEASE}/kernel/drivers/net/ethernet/realtek/

# nct6687d kernel module
# Create necessary directories and clone repository
# nct6687 module for b550m mortar wifi

git clone https://github.com/Fred78290/nct6687d.git
# Patch Makefile and install the Kernel module to a temporary directory
echo -e 'obj-m += nct6687.o
all:
\tmake -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
install: all
\tmake -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules_install
clean:
\tmake -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
' > nct6687d/Makefile

make -C . M=./nct6687d modules
# xz
xz -z ./nct6687d/nct6687.ko
cp ./nct6687d/nct6687.ko.xz /lib/modules/${KERNELRELEASE}/kernel/drivers/hwmon/
