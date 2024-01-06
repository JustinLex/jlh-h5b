{ config, pkgs, nodeHostName, ... }:

{
  networking.hostName = nodeHostName;

  networking.networkmanager.enable = true;  # Enable networking
  networking.firewall.enable = false;  # Disable the firewall

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    htop
    dig
    dmidecode
    usbutils
    pciutils
    unzrip
    trivy
  ];


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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAQyoW3CMKC8d/86s18GMGT/QlX5IIopUOpWq8XSBTkw jlh@dio"
    ] ++ githubKeys;
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
