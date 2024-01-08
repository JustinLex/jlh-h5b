{ config, pkgs, ... }:

# Fanless Intel quad-core atom box from 2019 (Intel Celeron J1900)
# Zigbee router, DHCP server, and DNS server

# The original Porygon was the original testbed for IaC Nix Kubernetes nodes.
# It was a Raspberry Pi 4 4GiB that ran zigbee2mqtt on top of k3s. It had no other applications running on it.
# It took a few iterations to find a "truly IaC on Edge" configuration that would work on a Raspberry Pi 3/4.
# One of the iterations had tried to use CoreOS, until finally settling on NixOS.
# The proygon configuration was defined at these two git repos:
# * https://github.com/JustinLex/nixpi
# * https://github.com/JustinLex/jlh-h5b/tree/main/porygon_applications

{

  # Mount /var
  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/0ffdf107-457c-4558-90d1-3ac73a09df2a";
    fsType = "xfs";
  };

  networking = {
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
        ipv6.addresses = [{
          address = "2600:70ff:b04f:2::53";
          prefixLength = 64;
        }];
      };
      enp1s0.useDHCP = false;
      enp2s0.useDHCP = false;
      enp3s0.useDHCP = false;
      enp4s0.useDHCP = false;
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
    # Disabled while testing dhcpv6+ddns
#    dhcp4 = {
#      enable = true;
#      settings = {
#        # https://kea.readthedocs.io/en/kea-2.4.1/arm/dhcp4-srv.html
#
#      };
#    };

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
        };

        # And we specify the type of lease database
        "lease-database" = {
          "type" = "memfile";
          "persist" = true;
          "name" = "/var/lib/kea/dhcp6.leases";
        };

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

            # Subnet interface is required for dhcpv6 https://kea.readthedocs.io/en/kea-2.4.1/arm/dhcp6-srv.html#ipv6-subnet-selection
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
              "type" = "string";
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
          { "name" = "srv-fqdn"; "code" = 3; "space" = "ntp"; "data" = "gbg1.ntp.se"; }
          { "name" = "srv-fqdn"; "code" = 3; "space" = "ntp"; "data" = "gbg2.ntp.se"; }
          { "name" = "srv-fqdn"; "code" = 3; "space" = "ntp"; "data" = "mmo1.ntp.se"; }
          { "name" = "srv-fqdn"; "code" = 3; "space" = "ntp"; "data" = "mmo2.ntp.se"; }
          { "name" = "srv-fqdn"; "code" = 3; "space" = "ntp"; "data" = "sth1.ntp.se"; }
          { "name" = "srv-fqdn"; "code" = 3; "space" = "ntp"; "data" = "sth2.ntp.se"; }
          { "name" = "srv-fqdn"; "code" = 3; "space" = "ntp"; "data" = "svl1.ntp.se"; }
          { "name" = "srv-fqdn"; "code" = 3; "space" = "ntp"; "data" = "svl2.ntp.se"; }
        ];
      };
    };

    # Disabled while testing dhcpv6
#    dhcp-ddns = {
#      enable = true;
#      settings = {
#        # https://kea.readthedocs.io/en/kea-2.4.1/arm/ddns.html
#      };
#    };


  };

  # Configure KnotDNS, my authoritative name server for DDNS records for DHCP clients
  services.knot = {
    enable = true;
    settingsFile = pkgs.writeText "knot.conf" ''
# https://www.knot-dns.cz/docs/3.3/html/configuration.html#simple-configuration

server:
  listen: 10.0.0.53@54
  listen: 2600:70ff:b04f:2::53@54

#zone:
#  - domain: example.com
#    storage: /var/lib/knot/zones/
#    file: example.com.zone
#
#log:
#  - target: syslog
#    any: info
    '';
  };

  # Configure DNScrypt Proxy, my local forwarding name server for using Oblivious DNS-over-HTTPS
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      # Default settings defined here:
      # https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml)
      listen_addresses = ["10.0.0.53:53" "[2600:70ff:b04f:2::53]:53"];

      # Use both ipv4 and ipv6 servers
      ipv4_servers = true;
      ipv6_servers = true;

      # Only use ODoH
      dnscrypt_servers = false;
      doh_servers = false;
      odoh_servers = true;

      # Security requirements for servers
      require_dnssec = true;
      require_nolog = true;
      require_nofilter = true;

      # Use all 6 european odoh servers instead of just 2, for extra security
#      4ms odoh-koki-se
#      31ms odoh-cloudflare
#      33ms odoh-koki-ams
#      39ms odoh-marco.cx
#      46ms odoh-ibksturm
#      71ms odoh-crypto-sx
#      261ms odoh-jp.tiar.app
#      1042ms odoh-jp.tiarap.org

      lb_strategy = "p6";

      # Optimize cache
      cache_size = 8192;
      cache_neg_min_ttl = 5;
      cache_neg_max_ttl = 10;

      # Enable ODoH lists (disabled by default)
      sources.odoh-servers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-servers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/odoh-servers.md"
        ];
        cache_file = "odoh-servers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        refresh_delay = 24;
        prefix = "";
      };
      sources.odoh-relays = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-relays.md"
          "https://download.dnscrypt.info/resolvers-list/v3/odoh-relays.md"
        ];
        cache_file = "odoh-relays.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        refresh_delay = 24;
        prefix = "";
      };
      anonymized_dns.routes = [ { server_name="*"; via=["odohrelay-se"]; } ];  # Use Swedish relay for all odoh servers
    };
  };

  # TODO: prometheus: knot, kea


#  # Configure zigbee2mqtt
#  services.zigbee2mqtt = {
#    enable = true;
#    enable = true;
#    settings = {
#
#    };
#  };

}
