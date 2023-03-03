#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# mainly for patches
#
git checkout 20221220

cp unraid_6.11.1_conf_regen-6.1-vendor-reset-gcc .config
sed -i '/WLAN_VEN/d' .config
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/patch-6.1.15.xz
xzcat patch-6.1.*.xz | patch -p1
