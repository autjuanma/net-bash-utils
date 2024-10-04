#!/bin/bash

# Check if OpenVPN is running
if pgrep -f openvpn > /dev/null
then
  echo "OpenVPN is running..."
else
  echo "OpenVPN is not running. Please start the OpenVPN server and client."
  exit 1
fi

# Check if the VPN connection is established
if ip addr show tun0 | grep "inet " > /dev/null
then
  echo "VPN connection is established..."
else
  echo "VPN connection is not established. Please check the OpenVPN logs for errors."
  exit 1
fi

# Get the original IP address
ORIGINAL_IP=$(curl -4 icanhazip.com)

# Get the new IP address through the VPN
NEW_IP=$(curl -4 --interface tun0 icanhazip.com)

# Check if the IP address has changed
if [ "$ORIGINAL_IP" != "$NEW_IP" ]
then
  echo "IP address has changed successfully!"
  echo "Original IP: $ORIGINAL_IP"
  echo "New IP: $NEW_IP"
else
  echo "IP address has not changed. Please check the OpenVPN configuration and logs for errors."
fi