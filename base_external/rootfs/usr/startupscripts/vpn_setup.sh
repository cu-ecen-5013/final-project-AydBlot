#!/bin/sh
LOGFILE=/var/log/startup-openvpn-key-gen.log
if grep -Fxq FINISHED $LOGFILE
then
	echo "openVPN keys already established"
	exit 0
fi
cd /etc/openvpn/easy-rsa/
echo "Initializing Public Key Infrastructure"
./easyrsa init-pki >> $LOGFILE
echo "Building CA key"
./easyrsa build-ca nopass >> $LOGFILE 
echo "Building the server key"
./easyrsa gen-req vpn-server nopass >> $LOGFILE 
echo "Signing the server key with the CA, please enter the CA password entered above"
./easyrsa sign-req server vpn-server >> $LOGFILE 
echo "Building the client key"
./easyrsa gen-req client01 nopass >> $LOGFILE 
echo "Signing the client key with the CA, please enter the CA pasword entered above"
./easyrsa sign-req client client01 >> $LOGFILE 

echo "Generate the Diffie-Hellman key, this may take a while"
./easyrsa gen-dh >> $LOGFILE 
echo "Generate Certificate Revoking List"
./easyrsa gen-crl nopass >> $LOGFILE 

cp pki/ca.crt /etc/openvpn/server/ >> $LOGFILE 
cp pki/issued/vpn-server.crt /etc/openvpn/server/ >> $LOGFILE 
cp pki/private/vpn-server.key /etc/openvpn/server/ >> $LOGFILE 
cp pki/dh.pem /etc/openvpn/server/ >> $LOGFILE 
cp pki/crl.pem /etc/openvpn/server/ >> $LOGFILE 

cp pki/ca.crt /etc/openvpn/client/ >> $LOGFILE 
cp pki/issued/client01.crt /etc/openvpn/client/ >> $LOGFILE 
cp pki/private/client01.key /etc/openvpn/client/ >> $LOGFILE 

#Place the proper IP address in the client configuration
IP_ADDRESS=$(cat /etc/network/vpn_ip_address.txt)
sed -i "5i$IP_ADDRESS" /etc/openvpn/client/client01.ovpn

openvpn --config /etc/openvpn/server/server.conf
echo "FINISHED" >> $LOGFILE 
