# nov/14/2022 10:38:34 by RouterOS 7.6
# software id = NCYA-ZUPS
#
# model = RB5009UPr+S+

# Layer 1
# https://help.mikrotik.com/docs/display/ROS/Ethernet
# https://help.mikrotik.com/docs/display/ROS/PoE-Out
/interface ethernet
set [ find default-name=ether1 ] name=ether1 \
    advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full,2500M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=18:FD:74:7B:01:27 orig-mac-address=18:FD:74:7B:01:27 \
    poe-out=off poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address power-cycle-ping-enabled=no !power-cycle-ping-timeout \
    rx-flow-control=off speed=2.5Gbps tx-flow-control=off
set [ find default-name=ether2 ] name=ether2 advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=68:7f:74:22:1c:23 orig-mac-address=18:FD:74:7B:01:28 \
    poe-out=auto-on poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address power-cycle-ping-enabled=no !power-cycle-ping-timeout \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether3 ] name=ether3 advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=18:FD:74:7B:01:29 orig-mac-address=18:FD:74:7B:01:29 \
    poe-out=auto-on poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address power-cycle-ping-enabled=no !power-cycle-ping-timeout \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether4 ] name=ether4 advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=18:FD:74:7B:01:2A orig-mac-address=18:FD:74:7B:01:2A \
    poe-out=auto-on poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address power-cycle-ping-enabled=no !power-cycle-ping-timeout \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether5 ] name=ether5 advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=18:FD:74:7B:01:2B orig-mac-address=18:FD:74:7B:01:2B \
    poe-out=auto-on poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address power-cycle-ping-enabled=no !power-cycle-ping-timeout \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether6 ] name=ether6 advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=18:FD:74:7B:01:2C orig-mac-address=18:FD:74:7B:01:2C \
    poe-out=auto-on poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address power-cycle-ping-enabled=no !power-cycle-ping-timeout \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether7 ] name=ether7 advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=18:FD:74:7B:01:2D orig-mac-address=18:FD:74:7B:01:2D \
    poe-out=auto-on poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address power-cycle-ping-enabled=no !power-cycle-ping-timeout \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=ether8 ] name=ether8 advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=18:FD:74:7B:01:2E orig-mac-address=18:FD:74:7B:01:2E \
    poe-out=auto-on poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address power-cycle-ping-enabled=no !power-cycle-ping-timeout \
    rx-flow-control=off speed=1Gbps tx-flow-control=off
set [ find default-name=sfp-sfpplus1 ] name=sfp-sfpplus1 advertise="" \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 mtu=1500 \
    mac-address=18:FD:74:7B:01:2F orig-mac-address=18:FD:74:7B:01:2F \
    rx-flow-control=off speed=10Gbps tx-flow-control=off\
    sfp-rate-select=high sfp-shutdown-temperature=95C

/interface ethernet switch
set 0 name=switch1 cpu-flow-control=yes mirror-egress-target=none

# This can be used to set TX/RX rate limits on the ports
/interface ethernet switch port
set 0 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 1 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 2 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 3 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 4 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 5 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 6 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 7 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 8 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
set 9 !egress-rate !ingress-rate mirror-egress=no mirror-ingress=no \
    mirror-ingress-target=none
/interface ethernet poe settings
set psu1-max-power=96W psu2-max-power=150W

# Layer 2

# Bonding
/interface bonding
add slaves=ether3,ether4,ether5,ether6,ether7,ether8 mode=802.3ad transmit-hash-policy=layer-3-and-4 name=trunk-bond

# Switch features:
# https://help.mikrotik.com/docs/display/ROS/Bridging+and+Switching#BridgingandSwitching-BridgeHardwareOffloading
# Note: QinQ not supported by hardware offload

/interface bridge
add name=bridge auto-mac=yes ageing-time=5m arp=enabled arp-timeout=auto \
    dhcp-snooping=no disabled=no fast-forward=yes forward-delay=15s igmp-snooping=no \
    mtu=auto protocol-mode=none \
    vlan-filtering=yes ether-type=0x8100 ingress-filtering=yes
/interface bridge settings
set allow-fast-path=yes use-ip-firewall=no use-ip-firewall-for-pppoe=no use-ip-firewall-for-vlan=no

# https://help.mikrotik.com/docs/display/ROS/Bridging+and+Switching#BridgingandSwitching-PortSettings
/interface bridge port
add interface=ether1 bridge=bridge disabled=no learn=yes hw=yes trusted=no \
    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
    frame-types=admit-all ingress-filtering=yes pvid=1 tag-stacking=no
#add interface=ether3 bridge=bridge disabled=no learn=yes hw=yes trusted=no \
#    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
#    frame-types=admit-only-untagged-and-priority-tagged ingress-filtering=yes pvid=2 tag-stacking=no
#add interface=ether4 bridge=bridge disabled=no learn=yes hw=yes trusted=no \
#    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
#    frame-types=admit-only-untagged-and-priority-tagged ingress-filtering=yes pvid=4 tag-stacking=no
#add interface=ether5 bridge=bridge disabled=no learn=yes hw=yes trusted=no \
#    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
#    frame-types=admit-only-untagged-and-priority-tagged ingress-filtering=yes pvid=17 tag-stacking=no
#add interface=ether6 bridge=bridge disabled=no learn=yes hw=yes trusted=no \
#    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
#    frame-types=admit-only-untagged-and-priority-tagged ingress-filtering=yes pvid=2 tag-stacking=no
#add interface=ether7 bridge=bridge disabled=no learn=yes hw=yes trusted=no \
#    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
#    frame-types=admit-only-untagged-and-priority-tagged ingress-filtering=yes pvid=2 tag-stacking=no
#add interface=ether8 bridge=bridge disabled=no learn=yes hw=yes trusted=no \
#    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
#    frame-types=admit-only-untagged-and-priority-tagged ingress-filtering=yes pvid=2 tag-stacking=no
add interface=sfp-sfpplus1 bridge=bridge disabled=no learn=yes hw=yes trusted=no \
    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
    frame-types=admit-all ingress-filtering=yes pvid=1 tag-stacking=no
add interface=trunk-bond bridge=bridge disabled=no learn=yes hw=yes trusted=no \
    broadcast-flood=yes unknown-multicast-flood=yes unknown-unicast-flood=yes \
    frame-types=admit-all ingress-filtering=yes pvid=1 tag-stacking=no

# https://help.mikrotik.com/docs/display/ROS/Bridging+and+Switching#BridgingandSwitching-BridgeVLANtable
# https://help.mikrotik.com/docs/display/ROS/Bridge+VLAN+Table
# https://help.mikrotik.com/docs/display/ROS/Basic+VLAN+switching
# bridge ports with the corresponding PVID are automatically added as untagged ports in this table
/interface bridge vlan
add bridge=bridge tagged=bridge,ether1,trunk-bond,sfp-sfpplus1 vlan-ids=128

# Configure CPU ports and static ips
# https://help.mikrotik.com/docs/display/ROS/Bridging+and+Switching#BridgingandSwitching-Managementaccessconfiguration
/interface vlan
add interface=bridge vlan-id=128 name=guest

/ip address
add address=10.0.0.1/16 interface=bridge
add address=10.128.0.1/16 interface=guest

# Packet queues
/queue type
set 0 kind=pfifo name=default pfifo-limit=50
set 1 kind=pfifo name=ethernet-default pfifo-limit=50
set 2 kind=sfq name=wireless-default sfq-allot=1514 sfq-perturb=5
set 3 kind=red name=synchronous-default red-avg-packet=1000 red-burst=20 \
    red-limit=60 red-max-threshold=50 red-min-threshold=10
set 4 kind=sfq name=hotspot-default sfq-allot=1514 sfq-perturb=5
set 5 kind=pcq name=pcq-upload-default pcq-burst-rate=0 pcq-burst-threshold=0 \
    pcq-burst-time=10s pcq-classifier=src-address pcq-dst-address-mask=32 \
    pcq-dst-address6-mask=128 pcq-limit=50KiB pcq-rate=0 \
    pcq-src-address-mask=32 pcq-src-address6-mask=128 pcq-total-limit=2000KiB
set 6 kind=pcq name=pcq-download-default pcq-burst-rate=0 \
    pcq-burst-threshold=0 pcq-burst-time=10s pcq-classifier=dst-address \
    pcq-dst-address-mask=32 pcq-dst-address6-mask=128 pcq-limit=50KiB \
    pcq-rate=0 pcq-src-address-mask=32 pcq-src-address6-mask=128 \
    pcq-total-limit=2000KiB
set 7 kind=none name=only-hardware-queue
set 8 kind=mq-pfifo mq-pfifo-limit=50 name=multi-queue-ethernet-default
set 9 kind=pfifo name=default-small pfifo-limit=10
/queue interface
set ether1 queue=only-hardware-queue
set ether2 queue=only-hardware-queue
set ether3 queue=only-hardware-queue
set ether4 queue=only-hardware-queue
set ether5 queue=only-hardware-queue
set ether6 queue=only-hardware-queue
set ether7 queue=only-hardware-queue
set ether8 queue=only-hardware-queue
set sfp-sfpplus1 queue=only-hardware-queue
set bridge queue=no-queue

/interface list
add comment=defconf exclude="" include="" name=WAN
add comment=defconf exclude="" include="" name=LAN

/interface detect-internet
set detect-interface-list=none internet-interface-list=none \
    lan-interface-list=none wan-interface-list=none

/interface list member
add comment=defconf disabled=no interface=bridge list=LAN
add comment=defconf disabled=no interface=guest list=LAN
add comment=defconf disabled=no interface=ether2 list=WAN


/ip firewall connection tracking
set enabled=auto generic-timeout=10m icmp-timeout=10s loose-tcp-tracking=yes \
    tcp-close-timeout=10s tcp-close-wait-timeout=10s tcp-established-timeout=\
    1d tcp-fin-wait-timeout=10s tcp-last-ack-timeout=10s \
    tcp-max-retrans-timeout=5m tcp-syn-received-timeout=5s \
    tcp-syn-sent-timeout=5s tcp-time-wait-timeout=10s tcp-unacked-timeout=5m \
    udp-stream-timeout=3m udp-timeout=10s

/ip neighbor discovery-settings
set discover-interface-list=LAN lldp-med-net-policy-vlan=disabled protocol=\
    cdp,lldp,mndp

/ip settings
set accept-redirects=no accept-source-route=no allow-fast-path=yes \
    arp-timeout=30s icmp-rate-limit=10 icmp-rate-mask=0x1818 ip-forward=yes \
    max-neighbor-entries=16384 route-cache=yes rp-filter=no secure-redirects=\
    yes send-redirects=yes tcp-syncookies=no
/ipv6 settings
set accept-redirects=yes-if-forwarding-disabled accept-router-advertisements=\
    yes-if-forwarding-disabled disable-ipv6=no forward=yes \
    max-neighbor-entries=16384

/ip cloud
set ddns-enabled=no ddns-update-interval=none update-time=yes
/ip cloud advanced
set use-local-address=no

# Configure WAN DHCP client https://help.mikrotik.com/docs/display/ROS/DHCP#DHCP-DHCPClient
/ip dhcp-client option
set clientid_duid code=61 name=clientid_duid value="0xff\$(CLIENT_DUID)"
set clientid code=61 name=clientid value="0x01\$(CLIENT_MAC)"
set hostname code=12 name=hostname value="\$(HOSTNAME)"

# Might want to set add-default-route to special-classless if Bahnhof is sending us option 121 routes that don't follow RFC spec
# client id is old mac address I initially set up the Bahnhof connection with
/ip dhcp-client
add add-default-route=yes default-route-distance=1 disabled=no interface=ether2 use-peer-dns=no use-peer-ntp=no

# 6to4 Tunnel configuration
/interface 6to4 add comment="Hurricane Electric IPv6 Tunnel Broker" disabled=no local-address=158.174.30.59 mtu=1280 \
name=he-tunnel remote-address=216.66.80.90
/interface list member add comment="IPv6 tunnel" disabled=no interface=he-tunnel list=WAN

/ipv6 route add comment="" disabled=no distance=1 dst-address=2000::/3 gateway=2600:70ff:b04f::1 scope=30 target-scope=10
/ipv6 address add address=2600:70ff:b04f::2/48 advertise=no disabled=no eui-64=no interface=he-tunnel
/ipv6 address add address=2600:70ff:b04f:2::2/64 interface=bridge advertise=yes
# /ipv6 address add address=2600:70ff:b04f:1::2/64 interface=bridge advertise=yes

# DHCP server configuration
# https://wiki.mikrotik.com/wiki/Manual:IP/DHCP_Server
# https://help.mikrotik.com/docs/display/ROS/DHCP#DHCP-Network
/ip pool
add name=dhcp-guest        ranges=10.128.0.2-10.128.1.255

/ip dhcp-server
add add-arp=no address-pool=dhcp-guest allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
client-mac-limit=unlimited conflict-detection=yes interface=guest lease-time=12h name=guest \
relay=0.0.0.0 use-radius=no

/ip dhcp-server network
add address=10.128.0.0/16 netmask=16 gateway=10.128.0.1 comment=Guest dhcp-option="" domain="hlund.jlh.name" !next-server \
    dns-server=10.0.0.53 ntp-server=""

# DHCP lease persistence https://help.mikrotik.com/docs/display/ROS/DHCP#DHCP-StoreConfiguration
/ip dhcp-server config
set accounting=yes interim-update=0s radius-password=empty store-leases-disk=5m

# SLAAC configuration
/ipv6 nd
set [ find default=yes ] advertise-dns=yes advertise-mac-address=yes \
    disabled=no dns="2600:70ff:b04f:2::53" hop-limit=unspecified interface=all \
    managed-address-configuration=yes mtu=unspecified other-configuration=no \
    ra-delay=3s ra-interval=3m20s-10m ra-lifetime=30m ra-preference=medium \
    reachable-time=unspecified retransmit-interval=unspecified
/ipv6 nd prefix default
set autonomous=yes preferred-lifetime=1h valid-lifetime=4w2d

# DNS resolver
# Not well documented, see /ip dns print
/ip dns
set servers=2600:70ff:b04f:2::53,10.0.0.53 allow-remote-requests=no


/ip firewall filter
add action=accept chain=input comment=\
    "defconf: accept established,related,untracked" connection-state=\
    established,related,untracked
add action=drop chain=input comment="defconf: drop invalid" connection-state=\
    invalid
add action=accept chain=input comment="defconf: accept ICMP" protocol=icmp
add action=accept chain=input comment=\
    "defconf: accept to local loopback (for CAPsMAN)" dst-address=127.0.0.1
add action=drop chain=input comment="defconf: drop all not coming from LAN" \
    in-interface-list=!LAN
add action=accept chain=forward comment="defconf: accept in ipsec policy" \
    ipsec-policy=in,ipsec
add action=accept chain=forward comment="defconf: accept out ipsec policy" \
    ipsec-policy=out,ipsec
add action=fasttrack-connection chain=forward comment="defconf: fasttrack" \
    connection-state=established,related hw-offload=yes
add action=accept chain=forward comment=\
    "defconf: accept established,related, untracked" connection-state=\
    established,related,untracked
add action=drop chain=forward comment="defconf: drop invalid" \
    connection-state=invalid
add action=drop chain=forward comment=\
    "defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    connection-state=new in-interface-list=WAN
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" out-interface-list=WAN src-address=10.0.0.0/8

# Hairpin NAT (aka NAT reflection)
add action=masquerade chain=srcnat dst-address=10.0.15.248 out-interface=bridge protocol=tcp src-address=10.0.0.0/8
add action=masquerade chain=srcnat dst-address=10.0.16.1 out-interface=bridge protocol=tcp src-address=10.0.0.0/8

# Port forwarding
add action=dst-nat chain=dstnat comment="Kubernetes API" dst-address=158.174.30.59 \
    protocol=tcp dst-port=6616 to-addresses=10.0.15.248 to-ports=6443
add action=dst-nat chain=dstnat comment="Ingress HTTP" dst-address=158.174.30.59 \
    protocol=tcp dst-port=80 to-addresses=10.0.16.1 to-ports=80
add action=dst-nat chain=dstnat comment="Ingress HTTPS" dst-address=158.174.30.59 \
    protocol=tcp dst-port=443 to-addresses=10.0.16.1 to-ports=443

/ip firewall service-port
set ftp disabled=no ports=21
set tftp disabled=no ports=69
set irc disabled=yes ports=6667
set h323 disabled=no
set sip disabled=no ports=5060,5061 sip-direct-media=yes sip-timeout=1h
set pptp disabled=no
set rtsp disabled=yes ports=554
set udplite disabled=no
set dccp disabled=no
set sctp disabled=no

/ip proxy
set always-from-cache=no anonymous=no cache-administrator=webmaster \
    cache-hit-dscp=4 cache-on-disk=no cache-path=web-proxy enabled=no \
    max-cache-object-size=2048KiB max-cache-size=unlimited \
    max-client-connections=600 max-fresh-time=3d max-server-connections=600 \
    parent-proxy=:: parent-proxy-port=0 port=8080 serialize-connections=no \
    src-address=::

/ip service
set telnet address="" disabled=no port=23 vrf=main
set ftp address="" disabled=no port=21
set www address="" disabled=no port=80 vrf=main
set ssh address="" disabled=no port=22 vrf=main
set www-ssl address="" certificate=none disabled=yes port=443 tls-version=any \
    vrf=main
set api address="" disabled=no port=8728 vrf=main
set winbox address="" disabled=no port=8291 vrf=main
set api-ssl address="" certificate=none disabled=no port=8729 tls-version=any \
    vrf=main

/ip socks
set auth-method=none connection-idle-timeout=2m enabled=no max-connections=\
    200 port=1080 version=4

/ip ssh
set allow-none-crypto=no always-allow-password-login=no forwarding-enabled=no \
    host-key-size=2048 strong-crypto=no

/ip traffic-flow
set active-flow-timeout=30m cache-entries=256k enabled=no \
    inactive-flow-timeout=15s interfaces=all packet-sampling=no \
    sampling-interval=0 sampling-space=0
/ip traffic-flow ipfix
set bytes=yes dst-address=yes dst-address-mask=yes dst-mac-address=yes \
    dst-port=yes first-forwarded=yes gateway=yes icmp-code=yes icmp-type=yes \
    igmp-type=yes in-interface=yes ip-header-length=yes ip-total-length=yes \
    ipv6-flow-label=yes is-multicast=yes last-forwarded=yes nat-dst-address=\
    yes nat-dst-port=yes nat-events=no nat-src-address=yes nat-src-port=yes \
    out-interface=yes packets=yes protocol=yes src-address=yes \
    src-address-mask=yes src-mac-address=yes src-port=yes sys-init-time=yes \
    tcp-ack-num=yes tcp-flags=yes tcp-seq-num=yes tcp-window-size=yes tos=yes \
    ttl=yes udp-length=yes

/ip upnp
set allow-disable-external-interface=no enabled=no show-dummy-rule=yes

/ipv6 firewall address-list
add address=::/128 comment="defconf: unspecified address" disabled=no \
    dynamic=no list=bad_ipv6
add address=::1/128 comment="defconf: lo" disabled=no dynamic=no list=\
    bad_ipv6
add address=fec0::/10 comment="defconf: site-local" disabled=no dynamic=no \
    list=bad_ipv6
add address=::ffff:0.0.0.0/96 comment="defconf: ipv4-mapped" disabled=no \
    dynamic=no list=bad_ipv6
add address=::/96 comment="defconf: ipv4 compat" disabled=no dynamic=no list=\
    bad_ipv6
add address=100::/64 comment="defconf: discard only " disabled=no dynamic=no \
    list=bad_ipv6
add address=2001:db8::/32 comment="defconf: documentation" disabled=no \
    dynamic=no list=bad_ipv6
add address=2001:10::/28 comment="defconf: ORCHID" disabled=no dynamic=no \
    list=bad_ipv6
add address=3ffe::/16 comment="defconf: 6bone" disabled=no dynamic=no list=\
    bad_ipv6
/ipv6 firewall filter
add action=accept chain=input comment=\
    "defconf: accept established,related,untracked" connection-state=\
    established,related,untracked
add action=drop chain=input comment="defconf: drop invalid" connection-state=\
    invalid
add action=accept chain=input comment="defconf: accept ICMPv6" protocol=\
    icmpv6
add action=accept chain=input comment="defconf: accept UDP traceroute" port=\
    33434-33534 protocol=udp
add action=accept chain=input comment=\
    "defconf: accept DHCPv6-Client prefix delegation." dst-port=546 protocol=\
    udp src-address=fe80::/10
add action=accept chain=input comment="defconf: accept IKE" dst-port=500,4500 \
    protocol=udp
add action=accept chain=input comment="defconf: accept ipsec AH" protocol=\
    ipsec-ah
add action=accept chain=input comment="defconf: accept ipsec ESP" protocol=\
    ipsec-esp
add action=accept chain=input comment=\
    "defconf: accept all that matches ipsec policy" ipsec-policy=in,ipsec
add action=drop chain=input comment=\
    "defconf: drop everything else not coming from LAN" in-interface-list=\
    !LAN
add action=accept chain=forward comment=\
    "defconf: accept established,related,untracked" connection-state=\
    established,related,untracked
add action=drop chain=forward comment="defconf: drop invalid" \
    connection-state=invalid
add action=drop chain=forward comment=\
    "defconf: drop packets with bad src ipv6" src-address-list=bad_ipv6
add action=drop chain=forward comment=\
    "defconf: drop packets with bad dst ipv6" dst-address-list=bad_ipv6
add action=drop chain=forward comment="defconf: rfc4890 drop hop-limit=1" \
    hop-limit=equal:1 protocol=icmpv6
add action=accept chain=forward comment="defconf: accept ICMPv6" protocol=\
    icmpv6
add action=accept chain=forward comment="defconf: accept HIP" protocol=139
add action=accept chain=forward comment="defconf: accept IKE" dst-port=\
    500,4500 protocol=udp
add action=accept chain=forward comment="defconf: accept ipsec AH" protocol=\
    ipsec-ah
add action=accept chain=forward comment="defconf: accept ipsec ESP" protocol=\
    ipsec-esp
add action=accept chain=forward comment=\
    "defconf: accept all that matches ipsec policy" ipsec-policy=in,ipsec

# Open ports
# https://forum.mikrotik.com/viewtopic.php?t=152246
add chain=forward dst-address=2600:70ff:b04f:2::54 protocol=tcp dst-port=53 action=accept comment=\
  "Allow DNS over TCP to nameserver"
add chain=forward dst-address=2600:70ff:b04f:2::54 protocol=udp dst-port=53 action=accept comment=\
  "Allow DNS over UDP to nameserver"

add action=drop chain=forward comment=\
    "defconf: drop everything else not coming from LAN" in-interface-list=\
    !LAN

/routing igmp-proxy
set query-interval=2m5s query-response-interval=10s quick-leave=no

/snmp
set contact="" enabled=no engine-id="" location="" src-address=:: \
    trap-community=public trap-generators=temp-exception trap-target="" \
    trap-version=1 vrf=main

/system clock
set time-zone-autodetect=yes time-zone-name=Europe/Stockholm date=apr/24/2023 time=12:00:00

/system identity
set name=MikroTik

/system leds
set 0 disabled=no interface=sfp-sfpplus1 leds=sfp-sfpplus1-led type=\
    interface-activity
/system leds settings
set all-leds-off=never

/system logging
set 0 action=memory disabled=no prefix="" topics=info
set 1 action=memory disabled=no prefix="" topics=error
set 2 action=memory disabled=no prefix="" topics=warning
set 3 action=echo disabled=no prefix="" topics=critical

/system note
set note="" show-at-login=yes

/system ntp client
set enabled=yes mode=unicast servers=10.0.0.53

/routing bgp template
set default as=65530 name=default

/snmp community
set [ find default=yes ] addresses=::/0 authentication-protocol=MD5 disabled=\
    no encryption-protocol=DES name=public read-access=yes security=none \
    write-access=no

/system logging action
set 0 memory-lines=1000 memory-stop-on-full=no name=memory target=memory
set 1 disk-file-count=2 disk-file-name=log disk-lines-per-file=1000 \
    disk-stop-on-full=no name=disk target=disk
set 2 name=echo remember=yes target=echo
set 3 bsd-syslog=no name=remote remote=0.0.0.0 remote-port=514 src-address=\
    0.0.0.0 syslog-facility=daemon syslog-severity=auto syslog-time-format=\
    bsd-syslog target=remote

/user group
set read name=read policy="local,telnet,ssh,reboot,read,test,winbox,password,w\
    eb,sniff,sensitive,api,romon,rest-api,!ftp,!write,!policy" skin=default
set write name=write policy="local,telnet,ssh,reboot,read,write,test,winbox,pa\
    ssword,web,sniff,sensitive,api,romon,rest-api,!ftp,!policy" skin=default
set full name=full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,\
    winbox,password,web,sniff,sensitive,api,romon,rest-api" skin=default


/certificate settings
set crl-download=no crl-store=ram crl-use=no

/system resource irq
set 0 cpu=auto
set 1 cpu=auto
set 2 cpu=auto
set 3 cpu=auto
set 4 cpu=auto
set 5 cpu=auto
set 6 cpu=auto
set 7 cpu=auto
set 8 cpu=auto
set 9 cpu=auto
set 10 cpu=auto
set 11 cpu=auto
set 12 cpu=auto
set 13 cpu=auto
set 14 cpu=auto
set 15 cpu=auto
set 16 cpu=auto
/system resource irq rps
set ether1 disabled=yes
set ether2 disabled=yes
set ether3 disabled=yes
set ether4 disabled=yes
set ether5 disabled=yes
set ether6 disabled=yes
set ether7 disabled=yes
set ether8 disabled=yes
set sfp-sfpplus1 disabled=yes

/system resource usb settings
set authorization=no

/system routerboard settings
set auto-upgrade=no boot-device=nand-if-fail-then-ethernet boot-protocol=\
    bootp force-backup-booter=no protected-routerboot=disabled \
    reformat-hold-button=20s reformat-hold-button-max=10m silent-boot=no
/system routerboard reset-button
set enabled=no hold-time=0s..1m on-event=""

/system upgrade mirror
set check-interval=1d enabled=no primary-server=0.0.0.0 secondary-server=\
    0.0.0.0 user=""

/system watchdog
set auto-send-supout=no automatic-supout=yes ping-start-after-boot=5m \
    ping-timeout=1m watch-address=none watchdog-timer=yes

/tool bandwidth-server
set allocate-udp-ports-from=2000 authenticate=yes enabled=yes max-sessions=\
    100
/tool e-mail
set address=0.0.0.0 from=<> port=25 tls=no user="" vrf=main
/tool graphing
set page-refresh=300 store-every=5min
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
/tool mac-server ping
set enabled=yes
/tool romon
set enabled=no id=00:00:00:00:00:00
/tool romon port
set [ find default=yes ] cost=100 disabled=no forbid=no interface=all
/tool sms
set allowed-number="" auto-erase=no channel=0 port=none receive-enabled=no
/tool sniffer
set file-limit=1000KiB file-name="" filter-cpu="" filter-direction=any \
    filter-interface="" filter-ip-address="" filter-ip-protocol="" \
    filter-ipv6-address="" filter-mac-address="" filter-mac-protocol="" \
    filter-operator-between-entries=or filter-port="" filter-size="" \
    filter-stream=no memory-limit=100KiB memory-scroll=yes only-headers=no \
    streaming-enabled=no streaming-server=0.0.0.0:37008
/tool traffic-generator
set latency-distribution-max=100us measure-out-of-order=no \
    stats-samples-to-keep=100 test-id=0
/user aaa
set accounting=yes default-group=read exclude-groups="" interim-update=0s \
    use-radius=no
/user settings
set minimum-categories=0 minimum-password-length=0

## PERSONALIZED CONFIG ##

# Configure ssh
/user
ssh-keys import user=admin public-key-file=id_rsa.pub
/ip ssh
set strong-crypto=yes
