#!/usr/bin/env sh

# Write Stunnel config files
echo $STUNNEL_CONF | base64 -d > /stunnel/stunnel.conf
echo $STUNNEL_CERT | base64 -d > /stunnel/stunnel.crt

# Connect to Stunnel
exec /usr/bin/stunnel /stunnel/stunnel.conf
