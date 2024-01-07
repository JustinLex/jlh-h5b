{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
      # docs: https://github.com/nix-community/nixos-generators/blob/master/README.md
    };
  };
  outputs = { self, nixpkgs, nixos-generators, ... }: {
    packages.x86_64-linux = {
      latios = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "raw-efi";
        modules = [
           ./common.nix
           ./nodes/latios.nix
        ];
        specialArgs = {
            # additional arguments to pass to modules
            nodeHostName = "latios";
        };
      };
      latias = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "raw-efi";
        modules = [
           ./common.nix
           ./nodes/latias.nix
        ];
        specialArgs = {
            # additional arguments to pass to modules
            nodeHostName = "latias";
        };
      };
      suicune = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "raw-efi";
        modules = [
           ./common.nix
           ./nodes/suicune.nix
        ];
        specialArgs = {
            # additional arguments to pass to modules
            nodeHostName = "suicune";
        };
      };
      chikorita = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "raw-efi";
        modules = [
           ./common.nix
           ./nodes/chikorita.nix
        ];
        specialArgs = {
            # additional arguments to pass to modules
            nodeHostName = "chikorita";
        };
      };
      porygontwo = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "raw-efi";
        modules = [
           ./common.nix
           ./nodes/porygontwo.nix
        ];
        specialArgs = {
            # additional arguments to pass to modules
            nodeHostName = "porygontwo";
        };
      };
    };
  };
}