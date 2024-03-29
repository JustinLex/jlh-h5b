{ config, pkgs, unstablePkgs, lib, ... }:

# Fanless Intel quad-core atom box from 2019 (Intel Celeron J1900)
# Zigbee router, DHCP server, and DNS server

# The original Porygon was the original testbed for IaC Nix Kubernetes nodes.
# It was a Raspberry Pi 4 4GiB that ran zigbee2mqtt on top of k3s. It had no other applications running on it.
# It took a few iterations to find a "truly IaC on Edge" configuration that would work on a Raspberry Pi 3/4.
# One of the iterations had tried to use CoreOS, until finally settling on NixOS.
# The porygon configuration was defined at these two git repos:
# * https://github.com/JustinLex/nixpi
# * https://github.com/JustinLex/jlh-h5b/tree/main/porygon_applications

{

  # Don't allow automatic reboot because of broken EFI, power has to be pulled in between restarts.
  system.autoUpgrade.allowReboot = lib.mkForce false;

  # Mount /var
  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/0ffdf107-457c-4558-90d1-3ac73a09df2a";
    fsType = "xfs";
  };


  networking = {
    useDHCP = false;
    bonds = {
      bondnet = {  # Internet access and DNS servers
        interfaces = [ "enp1s0" "enp2s0" ];
        driverOptions = {
          # https://www.kernel.org/doc/Documentation/networking/bonding.txt
          mode = "802.3ad";
          miimon = "100";
          lacp_rate = "fast";
        };
      };
    };
    interfaces = {
      bondnet = {
        useDHCP = false;
        ipv4.addresses = [{
          address = "10.0.0.53";
          prefixLength = 16;
        }];
        ipv6.addresses = [
          {  # IP for most services
            address = "2600:70ff:b04f:2::53";
            prefixLength = 64;
          }
          {  # IPv6 address for hlund.jlh.name nameserver
            address = "2600:70ff:b04f:2::54";
            prefixLength = 64;
          }
        ];
      };
    };
    defaultGateway = {
      address = "10.0.0.1";
      interface = "bondnet";
    };
    defaultGateway6 = {
      address = "2600:70ff:b04f:2::2";
      interface = "bondnet";
    };
  };


# Configure Kea DHCP server
  services.kea = {
    #Enable Kea API for kea-shell
    ctrl-agent = {
      enable = true;
      settings = {
        "control-sockets" = {
          "dhcp4" = {
            "comment" = "main server";
            "socket-type" = "unix";
            "socket-name" = "/run/kea/socket-v4";
          };
          "dhcp6" = {
            "socket-type" = "unix";
            "socket-name" = "/run/kea/socket-v6";
            "user-context" = { "version" = 3; };
          };
          "d2" = {
            "socket-type" = "unix";
            "socket-name" = "/run/kea/socket-d2";
          };
        };

        "loggers" = [
          {
            "name" = "kea-ctrl-agent";
            "severity" = "INFO";
          }
        ];
      };
    };

    dhcp4 = {
      enable = true;
      settings = {
        # https://kea.readthedocs.io/en/kea-2.4.1/arm/dhcp4-srv.html

        # First we set up global values
        "valid-lifetime" = 4000;
        "renew-timer" = 1000;
        "rebind-timer" = 2000;

        # Next we set up the interfaces to be used by the server.
        "interfaces-config" = {
          "interfaces" = [ "bondnet" ];
          "service-sockets-require-all" = true;
          "service-sockets-max-retries" = 30;
          "service-sockets-retry-wait-time" = 1000;
        };

        # And we specify the type of lease database
        "lease-database" = {
          "type" = "memfile";
          "persist" = true;
          "name" = "/var/lib/kea/dhcp4.leases";
        };

        # DDNS configuration
        "dhcp-ddns" ={
           "enable-updates" = true;
           "server-ip" = "::1";
           "server-port" = 53001;
           "sender-ip" = "";
           "sender-port" = 0;
           "max-queue-size" = 1024;
           "ncr-protocol" = "UDP";
           "ncr-format" = "JSON";
        };
        "ddns-override-client-update" = true; # Don't let clients refuse a DNS name
        "ddns-override-no-update" = true; # Don't let clients refuse a DNS name
        "ddns-qualifying-suffix" = "hlund.jlh.name.";
        "ddns-update-on-renew" = true;  # Set DNS records even for renews
        "ddns-use-conflict-resolution" = false;  # TEMPORARY FIX until the below option is added
#        "ddns-conflict-resolution-mode" = "check-exists-with-dhcid";  # Allow clients to overwrite DNS records, unless it's a static record. Removing this security check makes dual-stack environments work well. # NOT ADDED UNTIL KEA 2.5
        "hostname-char-set" = "[^A-Za-z0-9.-]";
        "hostname-char-replacement" = "-"; # Turn underscores/etc in hostname into dashes

        # Finally, we list the subnets from which we will be leasing addresses.
        "subnet4" = [
          {
            "id" = 1;
            "subnet" = "10.0.0.0/16";
            "interface" = "bondnet";
            "pools" = [
              {
                # Skip 10.0.0.1 for router, stop before 10.0.16.0/20 to leave room for MetalLB on the subnet, see "IP Blocks.md
                "pool" = "10.0.0.2 - 10.0.1.255";
              }
            ];
            "reservations" = [
              # Legacy nodes
              { "hw-address" = "00:02:C9:55:A2:04"; "ip-address" = "10.0.0.2"; } # Proxmox, aka pve.home.jlh.name
              { "hw-address" = "5A:B1:9C:82:4F:70"; "ip-address" = "10.0.0.3"; } # FreeNAS, aka freenas.home.jlh.name
              { "hw-address" = "3E:10:97:73:17:53"; "ip-address" = "10.0.0.4"; } # Ditto backup server, aka ditto.home.jlh.name

              # DNS
              { "hw-address" = "00:9E:27:E0:05:38"; "ip-address" = "10.0.0.53"; } # me lol

              # Legacy node
              { "hw-address" = "a6:9b:d3:a4:4e:ac"; "ip-address" = "10.0.15.248"; } # Cloyster Kubernetes Host, aka cloyster.home.jlh.name
            ];
          }
        ];

        "option-data" = [
          # https://kea.readthedocs.io/en/kea-2.4.1/arm/dhcp4-srv.html#dhcp4-std-options-list
          {
            "name" = "routers";
            "data" = "10.0.0.1";
            "always-send" = true;
          }
          {
            "name" = "domain-name-servers";
            "data" = "10.0.0.53";
            "always-send" = true;
          }
          {
            "name" = "domain-name";
            "data" = "hlund.jlh.name";
            "always-send" = true;
          }
#          { # Set MTU for IPv4
#            "name" = "interface-mtu";
#            "data" = "9000";
#          }
          {
            "name" = "ntp-servers";
            "data" = "10.0.0.53";
          }
          {
            "name" = "dhcp-server-identifier";
            "data" = "10.0.0.53";
            "always-send" = true;
          }
#          { # Enable NAT64
#            "name" = "v6-only-preferred";
#            "data" = 4000;  # Block IPv4 for 4000 secs
#            "always-send" = true;
#          }
          {
            "name" = "tcode";
            "data" = "Europe/Stockholm";
          }
          {
            "name" = "domain-search";
            "data" = "hlund.jlh.name";
          }
        ];

        # Management
        "control-socket" = {
          "socket-type" = "unix";
          "socket-name" = "/run/kea/socket-v4";
        };
        "hooks-libraries" = [
          { "library" = "${pkgs.kea}/lib/kea/hooks/libdhcp_lease_cmds.so"; }  # Add lease management commands to management API
        ];
      };
    };

    dhcp6 = {
      enable = true;
      settings = {
        # https://kea.readthedocs.io/en/kea-2.4.1/arm/dhcp6-srv.html

        # First we set up global values
        "valid-lifetime" = 4000;
        "renew-timer" = 1000;
        "rebind-timer" = 2000;
        "preferred-lifetime" = 3000;

        # Next we set up the interfaces to be used by the server.
        "interfaces-config" = {
          "interfaces" = [ "bondnet" ];
          "service-sockets-require-all" = true;
          "service-sockets-max-retries" = 30;
          "service-sockets-retry-wait-time" = 1000;
        };

        # And we specify the type of lease database
        "lease-database" = {
          "type" = "memfile";
          "persist" = true;
          "name" = "/var/lib/kea/dhcp6.leases";
        };

        # DDNS configuration
        "dhcp-ddns" ={
           "enable-updates" = true;
           "server-ip" = "::1";
           "server-port" = 53001;
           "sender-ip" = "";
           "sender-port" = 0;
           "max-queue-size" = 1024;
           "ncr-protocol" = "UDP";
           "ncr-format" = "JSON";
        };
        "ddns-override-client-update" = true; # Don't let clients refuse a DNS name
        "ddns-override-no-update" = true; # Don't let clients refuse a DNS name
        "ddns-qualifying-suffix" = "hlund.jlh.name.";
        "ddns-update-on-renew" = true;  # Set DNS records even for renews
        "ddns-use-conflict-resolution" = false;  # TEMPORARY FIX until the below option is added
#        "ddns-conflict-resolution-mode" = "check-exists-with-dhcid";  # Allow clients to overwrite DNS records, unless it's a static record. Removing this security check makes dual-stack environments work well. # NOT ADDED UNTIL KEA 2.5
        "hostname-char-set" = "[^A-Za-z0-9.-]";
        "hostname-char-replacement" = "-"; # Turn underscores/etc in hostname into dashes

        # Finally, we list the subnets from which we will be leasing addresses.
        "subnet6" = [
          {

            "id" = 1;
            "subnet" = "2600:70ff:b04f:2::/64";
            "pools" = [
              {
                # 2600:70ff:b04f:2::0:xxxx is reserved for static IPs, use 2600:70ff:b04f:2::1:xxxx
                "pool" = "2600:70ff:b04f:2::1:0/112";
              }
            ];

            "interface" = "bondnet";

          }
        ];

        "option-def" = [
          {
              "name" = "ntp-server";
              "code" = 56;
              "type" = "empty";
              "array" = false;
              "record-types" = "";
              "space" = "dhcp6";
              "encapsulate" = "ntp";
          }
          {
              "name" = "srv-addr";
              "code" = 1;
              "type" = "ipv6-address";
              "array" = true;
              "record-types" = "";
              "space" = "ntp";
              "encapsulate" = "";
          }
          {
              "name" = "mc-addr";
              "code" = 2;
              "type" = "ipv6-address";
              "array" = true;
              "record-types" = "";
              "space" = "ntp";
              "encapsulate" = "";
          }
          {
              "name" = "srv-fqdn";
              "code" = 3;
              "type" = "fqdn";
              "array" = true;
              "record-types" = "";
              "space" = "ntp";
              "encapsulate" = "";
          }
        ];

        "option-data" = [
          # DNS
          {
            "name" = "dns-servers";
            "data" = "2600:70ff:b04f:2::53";
          }

          # Search domain
          {
            "name" = "domain-search";
            "data" = "hlund.jlh.name";
          }

          # NTP
          {
            "name" = "ntp-server";
            "code" = 56;
            "space" = "dhcp6";
          }
          {
            "name" = "srv-fqdn";
            "code" = 3;
            "space" = "ntp";
            "data" = "sth1.ntp.se";
          }
        ];

        # Management
        "control-socket" = {
          "socket-type" = "unix";
          "socket-name" = "/run/kea/socket-v6";
        };
        "hooks-libraries" = [
          { "library" = "${pkgs.kea}/lib/kea/hooks/libdhcp_lease_cmds.so"; }  # Add lease management commands to management API
        ];
      };
    };

    dhcp-ddns = {
      enable = true;
      settings = {
        # https://kea.readthedocs.io/en/kea-2.4.1/arm/ddns.html
       "ip-address" = "::1";
        "port" = 53001;
        "dns-server-timeout" = 500;
        "ncr-protocol" = "UDP";
        "ncr-format" = "JSON";
        "tsig-keys" = [ ];
        "forward-ddns" = {
            "ddns-domains" = [
              {
                "name" = "hlund.jlh.name.";
                "key-name" = "";
                "dns-servers" = [
                  {
                    "ip-address" = "::1";
                    "port" = 54;
                  }
                ];
              }
            ];
        };
#          "reverse-ddns" = {};  # Reverse DNS is not neccessary for my network

        # Management
        "control-socket" = {
          "socket-type" = "unix";
          "socket-name" = "/run/kea/socket-d2";
        };
      };
    };
  };


  # Configure KnotDNS, my authoritative name server for DDNS records for DHCP clients
  services.knot = {
    enable = true;

    # https://www.knot-dns.cz/docs/3.3/html/configuration.html#simple-configuration
    settingsFile = pkgs.writeText "knot.conf" ''

server:
  listen: 2600:70ff:b04f:2::54@53  # Socket used for public DNS
  listen: ::1@54  # Socket used for DDNS

# DDNS access rule
acl:
  - id: ddns_acl
    address: ::1/128
    action: update

zone:
  - domain: hlund.jlh.name.
    storage: /var/lib/knot/zones
    file: hlund.jlh.name.zone # Note that /var/lib/knot/zones/hlund.jlh.name.zone must be created and managed
    serial-policy: increment
    dnssec-signing: on
    semantic-checks: soft # Do extra validity checks https://www.knot-dns.cz/docs/3.3/html/reference.html#semantic-checks
    acl: ddns_acl

log:
  - target: syslog
    any: info
    '';
  };

  # Initialize Knot's zonefile
  system.activationScripts =
    let hlundZonefile = pkgs.writeText "hlund.jlh.name.zone"
      ''
; https://en.wikipedia.org/wiki/Zone_file#Example_file
$ORIGIN hlund.jlh.name.     ; designates the start of this zone file in the namespace
$TTL 300                    ; default expiration time (in seconds) of all RRs without their own TTL value
hlund.jlh.name.   IN  SOA   ns.jlh.name. dns.jlh.name. ( 1111111111 7200 600 3600000 60 )
hlund.jlh.name.   IN  NS    ns.jlh.name.

hlund.jlh.name.   IN  A     158.174.30.59

router            IN  A     10.0.0.2
router            IN  AAAA  2600:70ff:b04f::2

porygontwo        IN  A     10.0.0.53
porygontwo        IN  AAAA  2600:70ff:b04f:2::53

ntp               IN  A     10.0.0.53

; kubernetes control-plane
cluster-api       IN  AAAA  2600:70ff:b04f:2:0:beef:0:0
;                  IN  AAAA  2600:70ff:b04f:2:0:beef:0:1
;                  IN  AAAA  2600:70ff:b04f:2:0:beef:0:2
suicune           IN  AAAA  2600:70ff:b04f:2:0:beef:0:0
entei             IN  AAAA  2600:70ff:b04f:2:0:beef:0:1
raikou            IN  AAAA  2600:70ff:b04f:2:0:beef:0:2

; kubernetes workers
latios            IN  AAAA  2600:70ff:b04f:2:0:beef:1:0
latias            IN  AAAA  2600:70ff:b04f:2:0:beef:1:1
chikorita         IN  AAAA  2600:70ff:b04f:2:0:beef:1:2
cyndaquil         IN  AAAA  2600:70ff:b04f:2:0:beef:1:3
totodile          IN  AAAA  2600:70ff:b04f:2:0:beef:1:4
      '';  # Writing file directly: https://stackoverflow.com/a/73377726
    in {
      install_pod = ''
      mkdir -p /var/lib/knot/zones
      cp ${hlundZonefile} /var/lib/knot/zones/hlund.jlh.name.zone
      chown -R knot:knot /var/lib/knot/zones
      chmod -R 770 /var/lib/knot/zones
      '';
    };


  # Configure Chrony, my local NTP server
  services.timesyncd.enable = false;
  services.chrony = {
    enable = true;

    # Don't access time servers through ipv6 tunnel
    # (Saves about 500us latency and eliminates random 20-70ms latency spikes)
    # Unfortunately, this also means the server is only accessible via ipv4
    extraFlags = ["-4"];

    extraConfig = ''
# Allow all connections
allow

# Use the Intel I211s' ethernet hardware clock
hwtimestamp *

# Mix all sources
minsources 2
combinelimit 7
    '';
  };
  networking.timeServers = [
    # Use the stockholm atomic clocks
    "sth1.ntp.se"
    "sth2.ntp.se"
    "sth2.ntp.se"
    "time1.stupi.se"
    "time2.stupi.se"
    "time4.stupi.se"
    "time20.stupi.se"
  ];
  # Start chrony after dnscrypt-proxy
  systemd.services.chronyd.after = [ "dnscrypt-proxy2.service" ];


  # Configure DNScrypt Proxy, my local forwarding name server for using Oblivious DNS-over-HTTPS
  networking.nameservers = [ "::1" ];
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      # Default settings defined here:
      # https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml)
      listen_addresses = ["[::1]:53" "10.0.0.53:53" "[2600:70ff:b04f:2::53]:53"];

      # Use both ipv4 and ipv6 servers
      ipv4_servers = true;
      ipv6_servers = true;

      # Only use DoH, ODoH is not stable
      dnscrypt_servers = false;
      doh_servers = true;
      odoh_servers = false;

      # Security requirements for servers
      require_dnssec = true;
      require_nolog = true;
      require_nofilter = true;

#      # Use top 4 doh servers instead of just 2, for extra security
#      lb_strategy = "p4";

      # Optimize cache
      cache_size = 8192;
      cache_neg_min_ttl = 5;
      cache_neg_max_ttl = 10;

#      # Enable ODoH lists (disabled by default)
#      sources.odoh-servers = {
#        urls = [
#          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-servers.md"
#          "https://download.dnscrypt.info/resolvers-list/v3/odoh-servers.md"
#        ];
#        cache_file = "odoh-servers.md";
#        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
#        refresh_delay = 24;
#        prefix = "";
#      };
#      sources.odoh-relays = {
#        urls = [
#          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-relays.md"
#          "https://download.dnscrypt.info/resolvers-list/v3/odoh-relays.md"
#        ];
#        cache_file = "odoh-relays.md";
#        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
#        refresh_delay = 24;
#        prefix = "";
#      };
#      anonymized_dns.routes = [ { server_name="*"; via=["*"]; } ];  # Use any relay for all odoh servers
    };
  };


   # Configure zigbee2mqtt
  services.zigbee2mqtt = {
    enable = true;
    package = unstablePkgs.zigbee2mqtt;
    settings = {
      mqtt = {
        base_topic = "zigbee2mqtt";
        server = "mqtt://10.0.16.0";
      };
      serial = {
        port = "/dev/serial/by-id/usb-dresden_elektronik_ingenieurtechnik_GmbH_ConBee_II_DE2485309-if00";
        adapter = "deconz";
      };

      advanced = {
        pan_id = 41307;
        ext_pan_id = [46 82 65 136 175 31 0 76];
        # Switch from channel 11 to avoid interference with Whirl Islands (chan 1) and TP-Link_E878 (chan 4) wifi networks
        channel = 25;
        network_key = "!networkkey.yaml network_key";
      };

      homeassistant = true;
      frontend = true;
      availability = true;

      devices = "devices.yaml";
      groups = "groups.yaml";
    };
  };

}
