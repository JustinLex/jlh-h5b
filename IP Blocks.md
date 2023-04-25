# IP Blocks
This document lays out the different IP blocks for my internal network.

## Notes

###IPv6
My ISP, Bahnhof, does not offer IPv6 at my apartment, 
so I am using Hurricane Electric's 6to4 tunnel to get a /48.

All networks are dual-stack. It would have been nice to go IPv6-only,
but some apps like Steam don't work on IPv6,
and most wifi-connected IoT devices don't support IPv6.

SLAAC is used to issue IPv6 addresses on both the internal and guest networks.

To get around local DNS name issues with IPv6,
stateful DHCPv6 is also used alongside SLAAC 
to issue an additional IPv6 address and add a DNS record for the hostname pointing to that IPv6 address.

## Networks
* Internal
  * My personal/work devices, VPN clients, media devices, and IoT devices
  * 10.0.0.0/16 subnet
    * 10.0.0.0/20 (DHCP)
    * 10.0.16.0/20 (Public External Kubernetes IPs)
    * 10.0.32.0/20 (Private External Kubernetes IPs)
  * 2600:70ff:b04f:1::/64 (DHCPv6)
  * 2600:70ff:b04f:2::/64 (SLAAC)
  * 2600:70ff:b04f:10:0:0::/96 (Kubernetes Pods)
  * 2600:70ff:b04f:10:1:0::/96  (Kubernetes Services)
  * 2600:70ff:b04f:20:0:0::/96  (Public External IPs, advertised with ExternalDNS)
  * 2600:70ff:b04f:20:1:0::/96  (Private External IPs)
  * No VLAN
  * Wifi network: Johto

* Guest Wifi
  * Anyone who connects to my guest wifi. Every device is locked in a /32 with no local network access, all they can do is talk to a Mullvad VPN client through NAT.
  * 10.128.0.0/16
  * fd67:7565:7374::/64 (ULA with "guest" in ASCII for prefix)
  * VLAN 128
  * Wifi network: Ping Against The Machine
