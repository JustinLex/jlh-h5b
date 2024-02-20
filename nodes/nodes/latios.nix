{ config, pkgs, ... }:

# Epyc gen 1 24-core in Fractal Define mid-tower case
# k3s worker and Ceph OSD host

{

  # Mount /var
  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/39fa028d-e147-428f-9f9f-6fbf2af76871";
    fsType = "xfs";
  };

  # Configure k3s
  services.k3s = {
    enable = true;
    role = "server";
#    serverAddr = "suicune.home.jlh.name";
#    tokenFile = ""; #TODO sops or agenix
    configPath = ../k3s-config.yaml;
  };

#  systemd.user.services."configure-ipmi" = {
#    enable = true;
#    serviceConfig.Type = "oneshot";
#    wantedBy = ["multi-user.target"];
#    path = with pkgs; [ ipmitool ];
#    script = ''
#      ipmitool xxxxx
#    '';
#  };

}
