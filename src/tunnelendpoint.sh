#!/bin/bash

#dumb wait for containers to start
echo "Initializing...."
sleep 1

#GET IP address of remote tunnel endpoint host (container)
REMOTE_TE_IP="$(getent hosts $REMOTE_TE_NAME | cut -d ' ' -f 1)"
echo "Tunnel with $REMOTE_TE_IP"

#create geneve tunnel endpoint via ip link
ip link add name $TUNNEL_ENDPOINT_NAME type geneve id $TUNNEL_VNI remote $REMOTE_TE_IP
ip link set dev $TUNNEL_ENDPOINT_NAME up

ip addr add $OVERLAY_IP dev $TUNNEL_ENDPOINT_NAME
ip route add $REMOTE_OVERLAY_ROUTE dev $TUNNEL_ENDPOINT_NAME

ping -c 10 $REMOTE_OVERLAY_GATEWAY