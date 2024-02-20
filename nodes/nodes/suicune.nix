{ config, pkgs, unstablePkgs, ... }:

# Atom N100 box with 16GiB ram
# k3s control plane

{

  # Mount /var
  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/0b808cce-f413-4c5d-aa16-1d7005ef83c1";
    fsType = "xfs";
  };

  networking = {
    bonds = {
      bondnet = {
        interfaces = [ "enp1s0" "enp3s0" ];
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
        ipv6.addresses = [
          {
            address = "2600:70ff:b04f:2:0:beef:0:0"; # Static IP for kubernetes control plane
            prefixLength = 64;
          }
        ];
      };
    };
    defaultGateway6 = {
      address = "2600:70ff:b04f:2::2";
      interface = "bondnet";
    };
    nameservers = ["2600:70ff:b04f:2::53" "10.0.0.53"];
    dhcpcd = {
      denyInterfaces = ["cilium*" "lxc*"]; # Don't waste cpu sending DHCP requests into k8s
      extraConfig = ''
        noipv4ll
      ''; # Fix race condition where ipv6 static address gets set early, so dhcpcd gives up on ipv4 before network is up
    }
  };

  # k3s db is kept in /var so no need to bootstrap every time server is deployed
  # k3s token is stored in /var, so cluster identity is maintained as long as /var is preserved

  # Configure k3s
  services.k3s = {
    enable = true;

    # Use newer k8s than the one included with stable
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/cluster/k3s/README.md
    package = unstablePkgs.k3s_1_29;

    role = "server";
    clusterInit = true; # Use etcd when initializing cluster instead of sqlite

    configPath = ../k3s-config.yaml;
  };

}
