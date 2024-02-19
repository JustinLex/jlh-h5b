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
    * 10.0.16.0/20 (Private External Kubernetes LBs, advertised with ExternalDNS and metalLB)
    * 10.0.32.0/20 (Public External Kubernetes LBs, advertised with ExternalDNS and metalLB)
  * 2600:70ff:b04f:2::/64 subnet
    * 2600:70ff:b04f:2::/64 (SLAAC)
    * 2600:70ff:b04f:2:0::/80 (static IPs)
      * 2600:70ff:b04f:2:0:beef:0::/112 (Kubernetes control-plane nodes)
      * 2600:70ff:b04f:2:0:beef:1::/112 (Kubernetes worker nodes)
    * 2600:70ff:b04f:2:1::/80 (DHCPv6)
  * No VLAN
  * Wifi network: Johto
  * Static IP addresses
    * Core routers/DNS (also have static IPv4 addresses for compatibility)
      * 2600:70ff:b04f::2 router.home.jlh.name
        * also 10.0.0.1
      * 2600:70ff:b04f:2::53 porygontwo.home.jlh.name
        * also 10.0.0.53
    * Kubernetes nodes (need static IPs for control-plane LB and for BGP)
      * control-plane
        * 2600:70ff:b04f:2:0:beef:0:0 suicune.home.jlh.name
        * 2600:70ff:b04f:2:0:beef:0:1 entei.home.jlh.name (TBD)
        * 2600:70ff:b04f:2:0:beef:0:2 raikou.home.jlh.name (TBD)
      * workers
        * 2600:70ff:b04f:2:0:beef:1:0 latios.home.jlh.name
        * 2600:70ff:b04f:2:0:beef:1:1 latias.home.jlh.name
        * 2600:70ff:b04f:2:0:beef:1:2 chikorita.home.jlh.name
        * 2600:70ff:b04f:2:0:beef:1:3 cyndaquil.home.jlh.name (TBD)
        * 2600:70ff:b04f:2:0:beef:1:4 totodile.home.jlh.name (TBD)

* Kubernetes IPv4 private network (Only exists inside kubernetes nodes)
  * 10.42.0.0/16 subnet (Kubernetes Pods, SNATed to nodes)
  * 10.43.0.0/16 subnet (Kubernetes Services)

* Kubernetes IPv6 Global Subnets
  * Only public subnet can be accessed from outside 2600:70ff:b04f::/48
  * 2600:70ff:b04f:beef:0:0::/80 (Kubernetes Pods)
  * 2600:70ff:b04f:beef:1:0:0::/112  (Kubernetes Services)
  * 2600:70ff:b04f:beef:2:0::/96  (Private External Kubernetes LBs, advertised with ExternalDNS and BGP)
  * 2600:70ff:b04f:beef:3:0::/96  (Public External Kubernetes LBs, advertised with ExternalDNS and BGP)


* Guest Wifi
  * Anyone who connects to my guest wifi. Every device is locked in a /32 with no local network access, all they can do is talk to a Mullvad VPN client through NAT.
  * 10.128.0.0/16
  * fd67:7565:7374::/64 (ULA with "guest" in ASCII for prefix)
  * VLAN 128
  * Wifi network: Ping Against The Machine
