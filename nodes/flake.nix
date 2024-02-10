{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11-small";
    unstable.url =  "nixpkgs/nixos-unstable-small";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, unstable, nixos-generators, ... }:
    let
      unstablePkgs = unstable.legacyPackages.x86_64-linux; # https://github.com/nix-community/home-manager/issues/1538#issuecomment-1265293260
      nodes = [
        "latios"
        "latias"
        "suicune"
        "chikorita"
        "porygontwo"
      ];
      generator = (
        # Function that templates out a value for the `packages` attrset.
        # Used for defining the NixOS generator for a given node.
        # docs: https://github.com/nix-community/nixos-generators/blob/master/README.md
        nodename:
          nixos-generators.nixosGenerate {
            system = "x86_64-linux";
            format = "raw-efi";
            modules = [
               ./common.nix
               ./nodes/${nodename}.nix
            ];
            specialArgs = {
                # additional arguments to pass to modules
                self = self;
                nodeHostName = nodename;
                unstablePkgs = unstablePkgs;
            };
          }
      );
      configuration = (
        # Function that templates out a value for the `nixosConfigurations` attrset.
        # Used for bundling a nixos configuration for the node to be used for autoUpgrades after deployment.
        nodename:
          nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
               ./raw-efi.nix # Duplicate some bits of config from upstream nixox-generators so that we can use nixos-rebuild
               ./common.nix
               ./nodes/${nodename}.nix
            ];
            specialArgs = {
                # additional arguments to pass to modules
                self = self;
                nodeHostName = nodename;
                unstablePkgs = unstablePkgs;
            };
          }
      );
    in {

      # This evaluates to: {"latios" = nixos-generators.nixosGenerate {...}; ... }
      packages.x86_64-linux = builtins.listToAttrs (
        map
          ( nodename: { "name" = nodename; "value" = generator(nodename); } )
          ( nodes )  # List of nodes to generate images for
      );

      # This evaluates to: {"latios" = nixpkgs.lib.nixosSystem {...}; ... }
      nixosConfigurations = builtins.listToAttrs (
        map
          ( nodename: { "name" = nodename; "value" = configuration(nodename); } )
          ( nodes )  # List of nodes to generate NixOS Configurations for
      );
  };
}