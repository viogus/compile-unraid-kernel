#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# r8125 kernel module
# get the source 
git clone https://github.com/awesometic/realtek-r8125-dkms.git 

make -C . M=./realtek-r8125-dkms/src modules_install
