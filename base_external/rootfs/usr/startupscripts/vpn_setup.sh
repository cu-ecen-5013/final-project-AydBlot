#!/bin/bash
cd /etc/openvpn/easy-rsa/
echo "Initializing Public Key Infrastructure"
./easyrsa init-pki
echo "Building CA key"
echo "Type a password for your CA key and a common name" 
./easyrsa build-ca
echo "Building the server key"
./easyrsa gen-req vpn-server nopass
echo "Signing the server key with the CA, please enter the CA password entered above"
./easyrsa sign-req server vpn-server
echo "Building the client key"
./easyrsa gen-req client01 nopass
echo "Signing the client key with the CA, please enter the CA pasword entered above"
./easyrsa sign-req client client01

echo "Generate the Diffie-Hellman key"
./easyrsa gen-dh
echo "Generate Certificate Revoking List"
./easyrsa gen-crl

cp pki/ca.crt /etc/openvpn/server/
cp pki/issued/vpn-server.crt /etc/openvpn/server/
cp pki/private/vpn-server.key /etc/openvpn/server/
cp pki/dh.pem /etc/openvpn/server/
cp pki/crl.pem /etc/openvpn/server/

cp pki/ca.crt /etc/openvpn/client/
cp pki/issued/client01.crt /etc/openvpn/client/
cp pki/private/client01.key /etc/openvpn/client/

