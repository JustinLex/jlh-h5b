# IP Blocks
This document lays out the different IP blocks for my internal network.

My home network is full-stack, and both IPv4 and IPV6 are used.

### Why MetalLB is on network "1"
Because I don't have fast Layer 3 routing on my home network, 
my devices and Kubernetes services share the same Layer 2 subnet.

This does mean that the node NICs are also connected to VLAN 1, but only MetalLB listens on VLAN 1.
All services such as SSH and kube api only listen on VLAN 3.

## IPv4

* Workstations/Kubernetes LBs (VLAN 1)
  * 10.1.0.0/16
  * Note: Workstations and nodes receive their IPs through DHCP, 
    but kubernetes services are dynamically allocated by MetalLB.
    * 10.1.0.0/20 DHCP range
    * 10.1.16.0/20 MetalLB IP pool
* IPMI (VLAN 2)
  * 10.2.0.0/16
* Nodes (VLAN 3)
  * 10.3.0.0/16
* Kubernetes Pods
  * 10.4.0.0/16
* Guest Wifi (VLAN 5)
  * 10.5.0.0/16
* IoT devices (VLAN 6)
  * 10.6.0.0/16

## IPv6

Since my ISP, Bahnhof, does not offer IPv6, these IP blocks are from the "Unique Local Address" block.

The ID for my ULA block is 448f3dc818.

* Workstations/Kubernetes Services (VLAN 1)
  * fd44:8f3d:c818:100::/64
* IPMI (VLAN 2)
  * fd44:8f3d:c818:200::/64
* Nodes (VLAN 3)
  * fd44:8f3d:c818:300::/64
* Kubernetes Pods
  * fd44:8f3d:c818:400::/64
* Guest Wifi (VLAN 5)
  * fd44:8f3d:c818:500::/64
* IoT devices (VLAN 6)
  * fd44:8f3d:c818:600::/64


## VLANs