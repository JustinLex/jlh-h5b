{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    unstable.url =  "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
      # docs: https://github.com/nix-community/nixos-generators/blob/master/README.md
    };
  };
  outputs = { self, nixpkgs, unstable, nixos-generators, ... }: {
    packages.x86_64-linux =
      let
        system = "x86_64-linux";
        unstablePkgs = unstable.legacyPackages.${system}; # https://github.com/nix-community/home-manager/issues/1538#issuecomment-1265293260
      in
      {
        latios = nixos-generators.nixosGenerate {
          system = "x86_64-linux";
          format = "raw-efi";
          modules = [
             ./common.nix
             ./nodes/latios.nix
          ];
          specialArgs = {
              # additional arguments to pass to modules
              self = self;
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
              self = self;
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
              self = self;
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
              self = self;
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
              self = self;
              nodeHostName = "porygontwo";
              unstablePkgs = unstablePkgs;
          };
        };
      };
  };
}