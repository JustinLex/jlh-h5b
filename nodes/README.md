# Nodes

Nix flake for generating disk images for my nodes

## Building a disk image for a node
```commandline
nix flake update .
nix build .#latios --impure
sudo dd if=result/nixos.img of=/dev/sda bs=4M
```

## Updating
Systems will auto upgrade using the configuration they were built with.

Make sure to bump flake.lock before building a new disk image.

## Generating SSH host keys
With hosts/ as your working directory, run `./generate-keys.sh <hostname>`.
Rekey with `nix run .#agenix-rekey.apps.x86_64-linux.rekey`
