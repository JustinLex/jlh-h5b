# IP Blocks
This document lays out the different IP blocks for my internal network.

## Notes

###IPv6
My ISP, Bahnhof, does not offer IPv6 at my apartment.
However, I would like to take advantage of the large subnets that IPv6 has, to make it easier to manage my network.
Also, I like the idea of having an IPv6 native Kubernetes cluster.

Because I have no global IPv6 subnets allocated to me, I am using a /48 from the "Unique Local Address" block.
The ID for my ULA block is 448f3dc818.

### Why MetalLB is on network "1"
Because I don't have fast Layer 3 routing on my home network, 
my devices and Kubernetes LBs share the same Layer 2 subnet.

This does mean that the node NICs are also connected to VLAN 1, but only MetalLB listens on VLAN 1.
All services such as SSH and the kube api only listen on VLAN 3.

## Networks

* Workstations/Kubernetes LBs 
  * 10.1.0.0/16
    * Note: Workstations and nodes receive their IPs through DHCP, 
      but kubernetes services are dynamically allocated by MetalLB.
      * 10.1.0.0/20 DHCP range
      * 10.1.16.0/20 MetalLB IP pool
  * fd44:8f3d:c818:100::/64
  * VLAN 1
* IPMI 
  * 10.2.0.0/16
  * fd44:8f3d:c818:200::/64
  * VLAN 2
* Nodes
  * 10.3.0.0/16
  * fd44:8f3d:c818:300::/64
  * VLAN 3
* Kubernetes Pods
  * 10.4.0.0/16
  * fd44:8f3d:c818:400::/64
  * (No VLAN, only exists inside kubernetes)
* Guest Wifi
  * 10.5.0.0/16
  * fd44:8f3d:c818:500::/64
  * VLAN 5
* IoT devices
  * 10.6.0.0/16
  * fd44:8f3d:c818:600::/64
  * VLAN 6
