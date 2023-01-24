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

wget https://git.kernel.org/torvalds/p/v6.2-rc6/v6.2-rc5
patch -p1 < v6.2-rc5
