#!/bin/sh

echo "0  : uboot, kernel, ramdisk, system"
echo "1  : uboot"
echo "2  :        kernel"
echo "3  :                ramdisk"
echo "4  :                         system"
echo "5  :        kernel, ramdisk, system"
echo "6  :   write and reboot the board  "
echo ""

while true
do
	read -p " which one?(Enter to quit, 6 => w&r)" todo
	todo=${todo:=7}
	
	case ${todo} in
		0)
			fastboot flash bootloader u-boot-iTOP-4412.bin
			fastboot flash kernel zImage
			fastboot flash ramdisk ramdisk-uboot.img
			fastboot flash system system.img
			;;
		1)
			fastboot flash bootloader u-boot-iTOP-4412.bin
			;;
		2)
			fastboot flash kernel zImage
			;;
		3)
			fastboot flash ramdisk ramdisk-uboot.img
			;;
		4)
			fastboot flash system system.img
			;;
		5)
			fastboot flash kernel zImage
			fastboot flash ramdisk ramdisk-uboot.img
			fastboot flash system system.img
			;;
		6)
			fastboot -w
			echo ""
			echo "=======>  Reboot the BOARDCode  <======="
			echo ""
			fastboot reboot
			break
			;;
		*)
			echo "You do not make a choice or chose a wrong choice. force to quit!"
			break
			;;
	esac
done
###################################################################################################
