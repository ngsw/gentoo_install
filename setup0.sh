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
