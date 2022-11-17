# IP Blocks
This document lays out the different IP blocks for my internal network.

## Notes

###IPv6
My ISP, Bahnhof, does not offer IPv6 at my apartment, 
so I am using Hurricane Electric's 6to4 tunnel to get a /48.

All networks are dual-stack. It would have been nice to go IPv6-only,
but some apps like Steam and Bittorrent don't work on IPv6,
and most wifi-connected IoT devices don't support IPv6.

### Network numbering
The network is quite flat, with all subnets running through my RB5009 core router, which then routes between the subnets.

There can be up to 256 subnets, one for each /16 in the 10.0.0.0/8 address space.

IPv4 subnets use the 10.0.0.0/8 private address space, as 10.XXX.0.0/16, 
where the X octet corresponds to the VLAN ID.

IPv6 subnets allocate a whole /64 for each subnet, 
with the VLAN ID used to subdivide the /48 obtained from Hurricane Electric.
This still leaves 256 /40s completely unused, which can be used for future IPv6-only networking.

## Networks

* Workstations
  * My personal/work devices such as my laptops and phones. Generally unrestricted access to any network.
  * 10.2.0.0/16
  * xxxx:xxxx:xxxx:0002::/64
  * VLAN 2
  * Wifi network: Johto
* VPN clients
  * Any devices connecting to my home Wireguard tunnel. Generally unrestricted access to any network.
  * 10.3.0.0/16
  * xxxx:xxxx:xxxx:0003::/64
  * VLAN 3
* Media devices
  * Devices such as Google TVs and Sonos Speakers that need access to the internet and media services.
  * 10.4.0.0/16
  * xxxx:xxxx:xxxx:0004::/64
  * VLAN 4
  * Wifi network: Goldenrod
* Gaming devices
  * My Windows gaming computer. It can access some network shares for its Steam library, as well as access media services.
  * 10.5.0.0/16
  * xxxx:xxxx:xxxx:0005::/64
  * VLAN 5
  * Wifi network: Celadon


* Servers and Raspberry Pis
  * Kubernetes hosts, and IoT RasPis like my 3d printer and my Zigbee2MQTT server.
  * 10.16.0.0/16
  * xxxx:xxxx:xxxx:0010::/64
  * VLAN 16
* IPMI / Management
  * Router consoles and server IPMI.
  * 10.17.0.0/16
  * xxxx:xxxx:xxxx:0011::/64
  * VLAN 17


* Kubernetes Pods
  * IPs that Kubernetes allocates to pods.
  * 10.32.0.0/16
  * xxxx:xxxx:xxxx:0020::/64
  * (No VLAN, as all routing is layer 3 through Calico+BGP)
* Kubernetes Services
  * IPs that Kubernetes allocates to ClusterIP services.
  * 10.33.0.0/16
  * xxxx:xxxx:xxxx:0021::/64
  * (No VLAN, as all routing is layer 3 through Calico+BGP)
* Kubernetes Public External IPs
  * Static IPs for Kubernetes services for outside access. These services are open to the internet.
  * 10.34.0.0/16
  * xxxx:xxxx:xxxx:0022::/64
  * (No VLAN, as all routing is layer 3 through Calico+BGP)
* Kubernetes PrivateExternal IPs
  * Static IPs for Kubernetes services for outside access. These services are not accessible from the internet.
  * 10.35.0.0/16
  * xxxx:xxxx:xxxx:0023::/64
  * (No VLAN, as all routing is layer 3 through Calico+BGP)


* Guest Wifi
  * Anyone who connects to my guest wifi. Every device is locked in a /32 with no local network access, all they can do is talk to a Mullvad VPN client through NAT.
  * 10.48.0.0/16
  * xxxx:xxxx:xxxx:0030::/64
  * VLAN 48
  * Wifi network: Ping Against The Machine


* IoT devices
  * Untrusted Wifi IoT devices like Xiaomi Smart Home.
  * 10.64.0.0/16
  * xxxx:xxxx:xxxx:0040::/64
  * VLAN 64
  * Wifi network: Whirl Islands
