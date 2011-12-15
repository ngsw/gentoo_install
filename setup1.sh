#!/bin/sh
fdisk /dev/sda <<'FDISKEOF'
d
1
d
2
d
3
n
p
1

+128M
n
p
2

+2048M
n
p
3


a
1
w

FDISKEOF

sleep 3

mkfs.ext2 /dev/sda1
mkfs.ext3 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2
mount /dev/sda3 /mnt/gentoo
mkdir /mnt/gentoo/boot
mount /dev/sda1 /mnt/gentoo/boot

cd /mnt/gentoo
stage3=`wget http://gentoo.channelx.biz/releases/x86/autobuilds/latest-stage3-i686.txt -O - 2> /dev/null|grep stage3`
wget http://gentoo.channelx.biz/releases/x86/autobuilds/${stage3}
tar xvjpf stage3-*.tar.bz2

cd /mnt/gentoo
wget http://gentoo.channelx.biz/snapshots/portage-latest.tar.bz2
tar xvjf /mnt/gentoo/portage-latest.tar.bz2 -C /mnt/gentoo/usr


