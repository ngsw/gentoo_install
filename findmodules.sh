#!/bin/sh
grep -v '#' /etc/conf.d/modules | grep modules
_res=$?
if [ ! "${_res}" -eq "0" ];then
  for module in `find /lib/modules/3.0.6-gentoo/ -type f -iname '*.o' -or -iname '*.ko'`
  do
    echo  modules=\"`basename ${module}|sed -e 's/\..*$//'`\" >> /etc/conf.d/modules
  done 
fi
