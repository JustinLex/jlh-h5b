{ config, pkgs, self, lib, nodeHostName, rootDecryptionKey, ... }:

{
  # Decrypt and expose agenix decryption key for node when building with nixos-generate
  system.activationScripts.install_key =
  let hostKey = derivation {
      name = "${nodeHostName}_key";
      system = builtins.currentSystem;
      builder = "${pkgs.bash}/bin/bash";
      args = [ "-c" "${pkgs.rage}/bin/rage -d -i ${rootDecryptionKey} -o $out ${./secrets/${nodeHostName}_ssh_host_ed25519_key.age}"];
  };
  in ''
    mkdir -p /etc/ssh/
    cp ${hostKey} /etc/ssh/ssh_host_ed25519_key
    cp .${/nodes/${nodeHostName}.pub} /etc/ssh/ssh_host_ed25519_key.pub
  '';
}