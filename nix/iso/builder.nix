{ inputs, system }:

let
  inherit (inputs) nixpkgs nixos-generators;

  pkgs = nixpkgs.legacyPackages.${system};

  lib = import ../lib { inherit inputs; };
in
{
  iso = nixos-generators.nixosGenerate {
    inherit system;
    format = "iso";

    modules = [
      ../hosts/iso/configuration.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
        };
      }
    ];
  };
}
