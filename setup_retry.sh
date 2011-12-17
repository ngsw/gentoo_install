#!/bin/sh
# # dhcpd eth0
# or
# # dhcpd -HD eth0
useradd jipp
echo 'jipp:jjj
root:jjj' | chpasswd
grep root /etc/group|grep jipp || sed -i 's/wheel:x:10:root/wheel:x:10:root,jipp/' /etc/group
ifconfig eth0 192.168.1.222 broadcast 192.168.1.255 netmask 255.255.255.0 up
route add default gw 192.168.1.1
cat > /etc/resolv.conf <<'EOF'
nameserver 192.168.1.1
nameserver 8.8.8.8
EOF
/etc/init.d/sshd restart

mount /dev/sda3 /mnt/gentoo
mount /dev/sda1 /mnt/gentoo/boot
mount -t proc none /mnt/gentoo/proc
mount --rbind /dev/ /mnt/gentoo/dev

cp -L /etc/resolv.conf /mnt/gentoo/etc/

grep 'GENTOO_MIRRORS' /mnt/gentoo/etc/make.conf
res1=$?
if [ ! "${res1}" -eq "0" ];then
  cat >> /mnt/gentoo/etc/make.conf << 'makeconf1EOF'
GENTOO_MIRRORS="http://gentoo.channelx.biz/ http://gentoo.gg3.net/ ftp://gg3.net/pub/linux/gentoo/ ftp://ftp.iij.ad.jp/pub/linux/gentoo/ http://ftp.iij.ad.jp/pub/linux/gentoo/ rsync://ftp.iij.ad.jp/pub/linux/gentoo/ http://ftp.jaist.ac.jp/pub/Linux/Gentoo/ rsync://ftp.jaist.ac.jp/pub/Linux/Gentoo/"
makeconf1EOF
fi

grep 'SYNC' /mnt/gentoo/etc/make.conf
res2=$?
if [ ! "${res2}" -eq "0" ] ;then
  cat >> /mnt/gentoo/etc/make.conf << 'makeconf2EOF'
SYNC="rsync://rsync5.jp.gentoo.org/gentoo-portage"
makeconf2EOF
fi
chroot /mnt/gentoo /bin/bash
