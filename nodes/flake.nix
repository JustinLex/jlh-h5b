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
      generate = (
        # attrset Template for configuring NixOS generator for a given node
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
    in {

      # This evaluates to: {"latios" = nixos-generators.nixosGenerate {...}; ... }
      packages.x86_64-linux = builtins.listToAttrs (
        map
          ( nodename: { "name" = nodename; "value" = generate(nodename); } )
          ( nodes )  # List of nodes to generate images for
      );

#        nixosConfigurations.porygontwo =
#          let a = 1;
#          in {
#
#          };

  };
}