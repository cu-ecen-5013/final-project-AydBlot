#!/bin/sh
iptables -A INPUT -i wlan0 -m state --state NEW -p tcp --dport 1194 -j ACCEPT

#Allow TUN interface connections to OpenVPN server
iptables -A INPUT -i tun+ -j ACCEPT

#Allow TUN interface connections to be forwarded through other interfaces
iptables -A FORWARD -i tun+ -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate NEW -i tun0 -s 10.5.0.0/24 -d 192.168.1.0/24 -o wlan0 -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate NEW -i wlan0 -s 192.168.1.0/24 -d 10.5.0.0/24 -o tun0 -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate NEW -i tun0 -s 10.5.0.0/24 -d 192.168.1.0/24 -o eth0 -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate NEW -i eth0 -s 192.168.1.0/24 -d 10.5.0.0/24 -o tun0 -j ACCEPT

#NAT the VPN client traffic to the Internet. change the ip address mask according to your info of tun0 result while running "ifconfig" command.
iptables -t nat -A POSTROUTING -s 10.5.0.0/24 -o wlan0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.5.0.0/24 -o eth0 -j MASQUERADE

iptables -A OUTPUT -o tun+ -j ACCEPT

iptables-save
