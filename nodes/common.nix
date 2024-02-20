{ config, pkgs, self, lib, nodeHostName, rootDecryptionKey, ... }:

{
  networking.hostName = nodeHostName;

  # Enable firmware loading
  hardware.enableRedistributableFirmware = true;

  # Required for Cilium
  boot.kernelModules = ["ip6table_mangle" "ip6table_raw"];

  age = {

    # Define agenix-rekey credentials
    rekey = {
      hostPubkey = ./nodes/${nodeHostName}.pub;
      masterIdentities = [ rootDecryptionKey ];
    };

    # Path to decryption key for agenix on node.
    # This key is bootstrapped by inject-hostkey.nix only when building the usb image.
    # We depend on /etc/ persistence to remember the key after a nixos-upgrade
    identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    # Secret files
    secrets = {
      host_key.rekeyFile = ./secrets/${nodeHostName}_ssh_host_ed25519_key.age;
    };

  };

  # Use stable ssh host key
  services.openssh.hostKeys = [];
  services.openssh.extraConfig = ''
    HostKey ${config.age.secrets.host_key.path}
  '';

  networking.firewall.enable = false;  # Disable the firewall

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    htop
    dig
    ipmitool
    lm_sensors
    smartmontools
    xfsprogs
    dmidecode
    efibootmgr
    usbutils
    pciutils
    unzrip
    trivy
  ];


  # Enable LVFS/fwupd
  services.fwupd.enable = true;

  # Enable TRIM timer
  services.fstrim = {
    enable = true;
    interval = "daily";
  };


  # Use sudo-rs instead of sudo for better security
  security.sudo.enable = false;
  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = false;  # Don't require a password for sudo
  };


  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jlh =

  # Used for setting SSH authorized keys:
  # Get file with keys from github, read it as a string, split each line into separate strings, and drop any empty lines
  let keyList = builtins.split "\n" (builtins.readFile (builtins.fetchurl https://github.com/JustinLex.keys ));
  isNotEmptyString = e: (builtins.isString e) && (builtins.lessThan 0 (builtins.stringLength e));
  githubKeys = builtins.filter isNotEmptyString keyList;

  in {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAQyoW3CMKC8d/86s18GMGT/QlX5IIopUOpWq8XSBTkw jlh@dio"
    ] ++ githubKeys;
  };

  # Enable automatic updates
  # https://nixos.wiki/wiki/Automatic_system_upgrades
  system.autoUpgrade = {
    enable = true;
    dates = "Sun *-*-* 03:00 Europe/Stockholm"; # Every week on sunday mornings
    randomizedDelaySec = "6hr"; # Between 03:00 and 09:00, to minimize the chance of multiple systems rebooting at the same time
    allowReboot = true;

    flake = "path:${self.outPath}#${nodeHostName}";  # flake path must be preceded with "path:" because otherwise nix build will get confused when we ask to build a flake in the nix store

    flags = [
      "--update-input"
      "nixpkgs"
      "--update-input"
      "unstable"
      "-L" # print build logs
      "--impure"
    ];
  };

  # prometheus: smartctl

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
