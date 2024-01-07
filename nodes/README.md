# Nodes

Nix flake for generating disk images for my nodes

## Building a disk image for a node
```commandline
nix build .#latios
sudo dd if=result/nixos.img of=/dev/sda bs=4M
```