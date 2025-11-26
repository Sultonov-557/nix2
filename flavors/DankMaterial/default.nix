{ inputs }:

{
  # Flavor metadata
  name = "DankMaterial";
  description = "Hyprland + DankMaterialShell";

  specialisation =
    { ... }:
    {
      imports = [
        ./system
        inputs.stylix.nixosModules.stylix
      ];

      home-manager.users.nixuser.imports = [
        ./home
      ];
    };
}
