#!/bin/bash

# Step 1: Check actual IP
echo "Actual IP:"
initial_ip=$(wget -qO - https://api.ipify.org)
echo "$initial_ip"

# Step 2: Check IP with Tor socks
echo "IP with Tor socks:"
torsocks wget -qO - https://api.ipify.org; echo

# Step 3: Enable Tor socks
source torsocks on

# Step 4: Verify IP
echo "Final IP:"
final_ip=$(wget -qO - https://api.ipify.org)
echo "$final_ip"

# Check if final IP is different from initial IP
if [ "$initial_ip" != "$final_ip" ]; then
  echo "Success! Final IP is different from initial IP."
else
  echo "Error: Final IP is the same as initial IP."
fi