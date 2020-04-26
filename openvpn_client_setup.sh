#!/bin/bash
echo "Please enter the ip address of your vpn server:"
read serverIP
echo "Please enter the vpn server password for scp purposes"
scp root@$serverIP:/etc/openvpn/client/* /etc/openvpn/
mv /etc/openvpn/client01.ovpn /etc/openvpn/client.conf
systemctl start openvpn
service openvpn@client start
