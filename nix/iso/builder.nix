{ inputs, system }:

let
  inherit (inputs) nixos-generators;
in
{
  iso = nixos-generators.nixosGenerate {
    inherit system;
    format = "iso";

    modules = [
      ../hosts/iso/configuration.nix
      inputs.home-manager.nixosModules.home-manager
      inputs.nur.modules.nixos.default
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
