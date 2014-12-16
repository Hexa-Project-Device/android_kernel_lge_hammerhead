#!/bin/sh

#Clean!
rm -rf boot.img

#Build!
mkbootimg --kernel arch/arm/boot/zImage-dtb --ramdisk ramdisk.img --cmdline "console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1" --base 0x00000000 --pagesize 2048 --ramdisk_offset 0x02900000 --tags_offset 0x02700000 --output boot.img