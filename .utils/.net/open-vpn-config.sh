#!/bin/bash

# Remove existing OpenVPN configuration files
rm -rf /etc/openvpn/*

# Generate certificates and keys
openssl req -x509 -newkey rsa:2048 -nodes -keyout ca.key -out ca.crt -days 365
openssl req -newkey rsa:2048 -nodes -keyout server.key -out server.csr
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 365
openssl req -newkey rsa:2048 -nodes -keyout client.key -out client.csr
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 365

# Generate Diffie-Hellman parameter file
openssl dhparam -out dh2048.pem 2048

# Create OpenVPN server configuration file
cat > /etc/openvpn/server.conf <<EOF
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
topology subnet
server 10.8.0.0 255.255.255.0
EOF