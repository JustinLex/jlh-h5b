# IP Blocks
This document lays out the different IP blocks for my internal network.

My home network is full-stack, and both IPv4 and IPV6 are used.

## IPv4

* Routers / Static IPs
  * 10.0.0.0/16
* Workstations
  * 10.1.0.0/16
* IPMI
  * 10.2.1.0/24
* Nodes
  * 10.2.2.0/24
* Kubernetes Services
  * 10.2.3.0/24
* IoT devices
  * 10.3.0.0/16
* Kubernetes Pods
  * 10.4.0.0/16
* Guest Wifi
  * 10.5.0.0/16

## IPv6

Since my ISP, Bahnhof, does not offer IPv6, these IP blocks are from the "Unique Local Address" block.

The ID for my ULA block is 448f3dc818.

* Routers / Static IPs
  * fd44:8f3d:c818::/64
* Workstations
  * fd44:8f3d:c818:100::/64
* IPMI
  * fd44:8f3d:c818:201::/64
* Nodes
  * fd44:8f3d:c818:202::/64
* Kubernetes Services
  * fd44:8f3d:c818:203::/64
* IoT devices
  * fd44:8f3d:c818:300::/64
* Kubernetes Pods
  * fd44:8f3d:c818:400::/64
* Guest Wifi
  * fd44:8f3d:c818:500::/64
