#!/bin/sh
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

echo "tun" >> /etc/modules-load.d/tun.conf
echo 1 > /proc/sys/net/ipv4/ip_forward

# route HTTPS traffic to reverse proxy in private network
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 443 -j DNAT --to-destination <HERE FILL PRIVATE IP ADDRESS>:443

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

openvpn --config /codenow/config/vpn.conf --askpass /codenow/config/pass