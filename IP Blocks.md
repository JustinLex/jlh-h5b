# IP Blocks
This document lays out the different IP blocks for my internal network.

My home network is full-stack, and both IPv4 and IPV6 are used.

## Why everything is on network "1"
Because I don't have fast Layer 3 routing on my home network, my devices and servers share the same Layer 2 subnet.

The IPMI, IoT, and Guest networks don't require more than 1gbit routing speed,
and they can be separated out into their own subnets and routed through my pfSense router. 
These networks have higher security risks so separating them out is a good idea.

Kubernetes Pods are on their own subnet because they are not routable outside of 
Kubernetes nodes unless BGP routing is used.

## IPv4

* Workstations/Nodes/Kubernetes Services
  * 10.1.0.0/16
* IPMI
  * 10.2.0.0/16
* IoT devices
  * 10.3.0.0/16
* Kubernetes Pods
  * 10.4.0.0/16
* Guest Wifi
  * 10.5.0.0/16

## IPv6

Since my ISP, Bahnhof, does not offer IPv6, these IP blocks are from the "Unique Local Address" block.

The ID for my ULA block is 448f3dc818.

* Workstations/Nodes/IPMI/Kubernetes Services
  * fd44:8f3d:c818:100::/64
* IPMI
  * fd44:8f3d:c818:200::/64
* IoT devices
  * fd44:8f3d:c818:300::/64
* Kubernetes Pods
  * fd44:8f3d:c818:400::/64
* Guest Wifi
  * fd44:8f3d:c818:500::/64

## VLANs