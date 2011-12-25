#!/bin/sh
grep -v '#' /etc/conf.d/net | grep eth0
_res=$?
if [ ! "${_res}" -eq "0" ];then
  cat > /etc/conf.d/net <<'NET.eof'

config_eth0="192.168.0.222 netmask 255.255.255.0 brd 192.168.0.255"
routes_eth0="default via 192.168.0.1"
NET.eof
fi
