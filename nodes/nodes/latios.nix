{ config, pkgs, ... }:

# Epyc gen 1 24-core in Fractal Define mid-tower case
# k3s worker and Ceph OSD host

{

  # Configure k3s
  services.k3s = {
    enable = true;
    role = "server";
#    serverAddr = "suicune.home.jlh.name";
#    tokenFile = ""; #TODO sops or agenix
    configPath = ../k3s-config.yaml;
  };

}
