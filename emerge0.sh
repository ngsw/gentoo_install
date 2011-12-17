#1/bin/sh
emerge vim
emerge pciutils
emerge gentoo-sources

echo "LSMOD"
read aaa
lsmod
read aaa

echo "LSPCI"
read aaa
lspci
read aaa

cd /usr/src
ls -l
cd /usr/src/linux
ls -l

make menuconfig
