#!/bin/sh

env-update
source /etc/profile
export PS1="(chroot) $PS1"
eselect profile set 4
sed -i 's/#ja_JP.EUC-JP EUC-JP/ja_JP.EUC-JP EUC-JP/' /etc/locale.gen
sed -i 's/#ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/#ja_JP EUC-JP/ja_JP EUC-JP/' /etc/locale.gen
sed -i 's/#en_US ISO-8859-1/en_US ISO-8859-1/' /etc/locale.gen
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

