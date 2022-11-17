# nov/14/2022 10:38:34 by RouterOS 7.6
# software id = NCYA-ZUPS
#
# model = RB5009UPr+S+

# Layer 2
/interface bridge
add admin-mac=18:FD:74:7B:01:28 ageing-time=5m arp=enabled arp-timeout=auto \
    auto-mac=no comment=defconf dhcp-snooping=no disabled=no fast-forward=yes \
    forward-delay=15s igmp-snooping=no max-message-age=20s mtu=auto name=\
    bridge priority=0x8000 protocol-mode=rstp transmit-hold-count=6 \
    vlan-filtering=no
/interface ethernet
# poe-out status: short_circuit
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full,2500M-full \
    arp=enabled arp-timeout=auto auto-negotiation=yes bandwidth=\
    unlimited/unlimited disabled=no full-duplex=yes l2mtu=1514 loop-protect=\
    default loop-protect-disable-time=5m loop-protect-send-interval=5s \
    mac-address=18:FD:74:7B:01:27 mtu=1500 name=ether1 orig-mac-address=\
    18:FD:74:7B:01:27 poe-out=auto-on poe-priority=10 poe-voltage=auto \
    power-cycle-interval=none !power-cycle-ping-address \
    power-cycle-ping-enabled=no !power-cycle-ping-timeout rx-flow-control=off \
    speed=2.5Gbps tx-flow-control=off
# poe-out status: short_circuit
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:7B:01:28 mtu=1500 name=ether2 orig-mac-address=18:FD:74:7B:01:28 \
    poe-out=auto-on poe-priority=10 poe-voltage=auto power-cycle-interval=\
    none !power-cycle-ping-address power-cycle-ping-enabled=no \
    !power-cycle-ping-timeout rx-flow-control=off speed=1Gbps \
    tx-flow-control=off
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:7B:01:29 mtu=1500 name=ether3 orig-mac-address=18:FD:74:7B:01:29 \
    poe-out=auto-on poe-priority=10 poe-voltage=auto power-cycle-interval=\
    none !power-cycle-ping-address power-cycle-ping-enabled=no \
    !power-cycle-ping-timeout rx-flow-control=off speed=1Gbps \
    tx-flow-control=off
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:7B:01:2A mtu=1500 name=ether4 orig-mac-address=18:FD:74:7B:01:2A \
    poe-out=auto-on poe-priority=10 poe-voltage=auto power-cycle-interval=\
    none !power-cycle-ping-address power-cycle-ping-enabled=no \
    !power-cycle-ping-timeout rx-flow-control=off speed=1Gbps \
    tx-flow-control=off
set [ find default-name=ether5 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:7B:01:2B mtu=1500 name=ether5 orig-mac-address=18:FD:74:7B:01:2B \
    poe-out=auto-on poe-priority=10 poe-voltage=auto power-cycle-interval=\
    none !power-cycle-ping-address power-cycle-ping-enabled=no \
    !power-cycle-ping-timeout rx-flow-control=off speed=1Gbps \
    tx-flow-control=off
set [ find default-name=ether6 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:7B:01:2C mtu=1500 name=ether6 orig-mac-address=18:FD:74:7B:01:2C \
    poe-out=auto-on poe-priority=10 poe-voltage=auto power-cycle-interval=\
    none !power-cycle-ping-address power-cycle-ping-enabled=no \
    !power-cycle-ping-timeout rx-flow-control=off speed=1Gbps \
    tx-flow-control=off
set [ find default-name=ether7 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:7B:01:2D mtu=1500 name=ether7 orig-mac-address=18:FD:74:7B:01:2D \
    poe-out=auto-on poe-priority=10 poe-voltage=auto power-cycle-interval=\
    none !power-cycle-ping-address power-cycle-ping-enabled=no \
    !power-cycle-ping-timeout rx-flow-control=off speed=1Gbps \
    tx-flow-control=off
set [ find default-name=ether8 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1514 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:7B:01:2E mtu=1500 name=ether8 orig-mac-address=18:FD:74:7B:01:2E \
    poe-out=auto-on poe-priority=10 poe-voltage=auto power-cycle-interval=\
    none !power-cycle-ping-address power-cycle-ping-enabled=no \
    !power-cycle-ping-timeout rx-flow-control=off speed=1Gbps \
    tx-flow-control=off
set [ find default-name=sfp-sfpplus1 ] advertise="" arp=enabled arp-timeout=\
    auto auto-negotiation=yes bandwidth=unlimited/unlimited disabled=no \
    full-duplex=yes l2mtu=1514 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    18:FD:74:7B:01:2F mtu=1500 name=sfp-sfpplus1 orig-mac-address=\
    18:FD:74:7B:01:2F rx-flow-control=off sfp-rate-select=high \
    sfp-shutdown-temperature=95C speed=10Gbps tx-flow-control=off
/queue interface
set bridge queue=no-queue
/interface ethernet switch
set 0 cpu-flow-control=yes mirror-egress-target=none name=switch1
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
/interface list
set [ find name=all ] comment="contains all interfaces" exclude="" include="" \
    name=all
set [ find name=none ] comment="contains no interfaces" exclude="" include="" \
    name=none
set [ find name=dynamic ] comment="contains dynamic interfaces" exclude="" \
    include="" name=dynamic
set [ find name=static ] comment="contains static interfaces" exclude="" \
    include="" name=static
add comment=defconf exclude="" include="" name=WAN
add comment=defconf exclude="" include="" name=LAN

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
# poe-out status: short_circuit
set ether1 queue=only-hardware-queue
# poe-out status: short_circuit
set ether2 queue=only-hardware-queue
set ether3 queue=only-hardware-queue
set ether4 queue=only-hardware-queue
set ether5 queue=only-hardware-queue
set ether6 queue=only-hardware-queue
set ether7 queue=only-hardware-queue
set ether8 queue=only-hardware-queue
set sfp-sfpplus1 queue=only-hardware-queue

/interface bridge port
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=yes ingress-filtering=yes interface=ether2 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=yes ingress-filtering=yes interface=ether3 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=yes ingress-filtering=yes interface=ether4 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=yes ingress-filtering=yes interface=ether5 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=yes ingress-filtering=yes interface=ether6 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=yes ingress-filtering=yes interface=ether7 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=yes ingress-filtering=yes interface=ether8 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=yes ingress-filtering=yes interface=sfp-sfpplus1 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
/interface bridge port-controller
# disabled
set bridge=none cascade-ports="" switch=none
/interface bridge port-extender
# disabled
set control-ports="" excluded-ports="" switch=none
/interface bridge settings
set allow-fast-path=yes use-ip-firewall=no use-ip-firewall-for-pppoe=no \
    use-ip-firewall-for-vlan=no

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

/interface detect-internet
set detect-interface-list=none internet-interface-list=none \
    lan-interface-list=none wan-interface-list=none

/interface ethernet poe settings
set psu1-max-power=96W psu2-max-power=150W

/interface list member
add comment=defconf disabled=no interface=bridge list=LAN
add comment=defconf disabled=no interface=ether1 list=WAN

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
add add-default-route=yes clientid=68:7f:74:22:1c:23 comment=defconf default-route-distance=1 \
    disabled=no interface=ether2 use-peer-dns=no use-peer-ntp=no

# DHCP server configuration
# https://wiki.mikrotik.com/wiki/Manual:IP/DHCP_Server
# https://help.mikrotik.com/docs/display/ROS/DHCP#DHCP-Network
/ip pool
add name=dhcp-workstations ranges=10.2.0.2-10.2.255.254
add name=dhcp-vpn          ranges=10.3.0.2-10.3.255.254
add name=dhcp-media        ranges=10.4.0.2-10.4.255.254
add name=dhcp-gaming       ranges=10.5.0.2-10.5.255.254
add name=dhcp-servers      ranges=10.16.0.2-10.16.255.254
add name=dhcp-management   ranges=10.17.0.2-10.17.255.254
add name=dhcp-guest        ranges=10.48.0.2-10.48.255.254
add name=dhcp-iot          ranges=10.64.0.2-10.64.255.254

/ip dhcp-server
add add-arp=no address-pool=dhcp-workstations allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
client-mac-limit=unlimited conflict-detection=yes interface=bridge lease-time=10m name=workstations \
relay=0.0.0.0 use-radius=no
# TODO: Not sure if I'm supposed to add a DHCP server here for VPN clients
# add add-arp=no address-pool=dhcp-vpn allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
# client-mac-limit=unlimited conflict-detection=yes interface=bridge lease-time=10m name=vpn \
# relay=0.0.0.0 use-radius=no
add add-arp=no address-pool=dhcp-media allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
client-mac-limit=unlimited conflict-detection=yes interface=bridge lease-time=10m name=media \
relay=0.0.0.0 use-radius=no
add add-arp=no address-pool=dhcp-gaming allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
client-mac-limit=unlimited conflict-detection=yes interface=bridge lease-time=10m name=gaming \
relay=0.0.0.0 use-radius=no
add add-arp=no address-pool=dhcp-servers allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
client-mac-limit=unlimited conflict-detection=yes interface=bridge lease-time=10m name=servers \
relay=0.0.0.0 use-radius=no
add add-arp=no address-pool=dhcp-management allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
client-mac-limit=unlimited conflict-detection=yes interface=bridge lease-time=10m name=management \
relay=0.0.0.0 use-radius=no
add add-arp=no address-pool=dhcp-guest allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
client-mac-limit=unlimited conflict-detection=yes interface=bridge lease-time=10m name=guest \
relay=0.0.0.0 use-radius=no
add add-arp=no address-pool=dhcp-iot allow-dual-stack-queue=no always-broadcast=no authoritative=yes \
client-mac-limit=unlimited conflict-detection=yes interface=bridge lease-time=10m name=iot \
relay=0.0.0.0 use-radius=no

#TODO: set up an NTP server
/ip dhcp-server network
add address=10.2.0.0/16 netmask=16 gateway=10.2.0.1 comment=Workstations dhcp-option="" domain="home" !next-server \
    dns-server=10.2.0.1 ntp-server=""
# TODO: Not sure if I'm supposed to add a DHCP server here for VPN clients
# add address=10.3.0.0/16 netmask=16 gateway=10.3.0.1 comment=VPN dhcp-option="" domain="home" !next-server \
#     dns-server=10.3.0.1 ntp-server=""
add address=10.4.0.0/16 netmask=16 gateway=10.4.0.1 comment=Media dhcp-option="" domain="home" !next-server \
    dns-server=10.4.0.1 ntp-server=""
add address=10.5.0.0/16 netmask=16 gateway=10.5.0.1 comment=Gaming dhcp-option="" domain="home" !next-server \
    dns-server=10.5.0.1 ntp-server=""
add address=10.16.0.0/16 netmask=16 gateway=10.16.0.1 comment=Servers dhcp-option="" domain="home" !next-server \
    dns-server=10.16.0.1 ntp-server=""
add address=10.17.0.0/16 netmask=16 gateway=10.17.0.1 comment=Management dhcp-option="" domain="home" !next-server \
    dns-server=10.17.0.1 ntp-server=""
add address=10.48.0.0/16 netmask=16 gateway=10.48.0.1 comment=Guest dhcp-option="" domain="home" !next-server \
    dns-server=10.48.0.1 ntp-server=""
add address=10.64.0.0/16 netmask=16 gateway=10.64.0.1 comment=IoT dhcp-option="" domain="home" !next-server \
    dns-server=10.64.0.1 ntp-server=""

# DHCP lease persistence https://help.mikrotik.com/docs/display/ROS/DHCP#DHCP-StoreConfiguration
/ip dhcp-server config
set accounting=yes interim-update=0s radius-password=empty store-leases-disk=5m

# SLAAC configuration
# TODO write a script like ipv6neigh to do DDNS by pulling nodes from /ipv6 neighbor and adding them to DNS
/ipv6 nd
set [ find default=yes ] advertise-dns=yes advertise-mac-address=yes \
    disabled=no dns="" hop-limit=unspecified interface=all \
    managed-address-configuration=no mtu=unspecified other-configuration=no \
    ra-delay=3s ra-interval=3m20s-10m ra-lifetime=30m ra-preference=medium \
    reachable-time=unspecified retransmit-interval=unspecified
/ipv6 nd prefix default
set autonomous=yes preferred-lifetime=1w valid-lifetime=4w2d

# Install cloudflare cert
/certificate import file-name=cloudflare-dns-com.pem

# DNS resolver
# Not well documented, see /ip dns print
/ip dns
set use-doh-server=https://cloudflare-dns.com/dns-query verify-doh-cert=yes \
    servers=2606:4700:4700::1111,2606:4700:4700::1001,1.1.1.1,1.0.0.1 \
    allow-remote-requests=yes cache-max-ttl=2w cache-size=10240KiB \
    max-concurrent-queries=1000 max-concurrent-tcp-sessions=50 \
    max-udp-packet-size=4096 query-server-timeout=2s query-total-timeout=10s \

/ip dns static
add address=10.2.0.1 disabled=no name=router.home ttl=1d

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
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN !to-addresses !to-ports
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
set time-zone-autodetect=yes time-zone-name=Europe/Stockholm
/system clock manual
set dst-delta=+00:00 dst-end="jan/01/1970 00:00:00" dst-start=\
    "jan/01/1970 00:00:00" time-zone=+00:00

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
set enabled=no mode=unicast servers="" vrf=main
/system ntp server
set auth-key=none broadcast=no broadcast-addresses="" enabled=no \
    local-clock-stratum=5 manycast=no multicast=no use-local-clock=no vrf=\
    main


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
