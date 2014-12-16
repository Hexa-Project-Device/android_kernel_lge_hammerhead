#!/bin/sh
#WARNING: This script is ONLY Modified for Nexus5. Ramdisk, Anything included in this command is based on Hammerhead(Nexus5).
#Also, This script is based on LOLLIPOP(Android5.0~Android5.0.X). In Kitkat, it could be work or not.

#Clean!
rm -rf out
make -j32 clobber
make cyanogenmod_hammerhead_defconfig
mkdir out
mkdir KDP-Tools
make -j128

#Build!
mkbootimg --kernel arch/arm/boot/zImage-dtb --ramdisk KDP-Tools/ramdisk.img --cmdline "console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1" --base 0x00000000 --pagesize 2048 --ramdisk_offset 0x02900000 --tags_offset 0x02700000 --output out/boot.img