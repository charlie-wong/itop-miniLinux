#!/bin/sh

CUR_HOME=`pwd`
echo "当前目录工作目录 $CUR_HOME"

#在 ./system 创建文件夹
cd system
CUR_SYSTEM=`pwd`
mkdir dev etc lib mnt proc sys tmp var

#在 ./system/ect 目录创建文件夹
cd etc
mkdir init.d rc.d

#在 ./system/ect/rc.d 目录创建文件夹
cd rc.d
mkdir init.d

#在 ./system/var 下创建目录
cd $CUR_SYSTEM/var
mkdir lib lock log run tmp

#拷贝文件并修改其权限
cp $CUR_HOME/wlc/eth0-setting $CUR_SYSTEM/etc/
cp $CUR_HOME/wlc/passwd $CUR_SYSTEM/etc/
cp $CUR_HOME/wlc/profile $CUR_SYSTEM/etc/
cd $CUR_SYSTEM/etc/
chmod 755 eth0-setting
chmod 755 passwd
chmod 755 profile

cp $CUR_HOME/wlc/ifconfig-eth0 $CUR_SYSTEM/etc/init.d/
cp $CUR_HOME/wlc/rcS $CUR_SYSTEM/etc/init.d/
cd init.d
chmod 755 rcS
chmod 755 ifconfig-eth0

cp $CUR_HOME/wlc/netd $CUR_SYSTEM/etc/rc.d/init.d
cd ../rc.d/init.d
chmod 755 netd

cd $CUR_SYSTEM/lib/
cp /usr/local/arm/arm-2009q3/arm-none-linux-gnueabi/libc/lib/* ./

#在 CUR_HOME 目录生成 system.img 文件
cd $CUR_HOME/
./wlc/make_ext4fs -s -l 314572800 -a root -L linux system.img system

