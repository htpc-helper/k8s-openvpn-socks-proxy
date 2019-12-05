#!/usr/bin/env sh

# Write OpenVPN config file
echo $CLIENT_CONF | base64 -d > /vpn/client.conf

# Create resources required by VPN
mkdir -p /run/openvpn
mkdir -p /dev/net
mknod /dev/net/tun c 10 200

# Connect to VPN
exec /usr/sbin/openvpn \
  --writepid /run/openvpn/server.pid \
  --cd /vpn \
  --config /vpn/client.conf \
  --script-security 2
