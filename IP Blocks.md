# IP Blocks
This document lays out the different IP blocks for my internal network.

## Notes

###IPv6
My ISP, Bahnhof, does not offer IPv6 at my apartment.
However, I would like to take advantage of the large subnets that IPv6 has, to make it easier to manage my network.
Also, I like the idea of having an IPv6 native Kubernetes cluster.

Because I have no global IPv6 subnets allocated to me, I am using a /48 from the "Unique Local Address" block.
The ID for my ULA block is 448f3dc818.

### Why everything is on network "1"
Because I don't have fast Layer 3 routing on my home network, 
my devices and Kubernetes LBs need to be on the same Layer 2 subnet.

For some reason, it is not possible to make kube-proxy listen on an interface where DHCP is disabled,
so we just put all nodes on the workstation network.

## Networks

* Workstations/Nodes/Kubernetes LBs 
  * 10.1.0.0/16
    * Note: Workstations and nodes receive their IPs through DHCP, 
      but kubernetes services are dynamically allocated by MetalLB.
      * 10.1.0.0/20 DHCP range
      * 10.1.16.0/20 MetalLB IP pool
  * fd44:8f3d:c818:100::/64 (It is statistically impossible for SLAAC and MetalLB to collide in a /64.)
  * VLAN 1
* IPMI 
  * 10.2.0.0/16
  * fd44:8f3d:c818:200::/64
  * VLAN 2
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
