{ modulesPath }:

{
  # Home-Manager configuration for DankMaterial flavor
  # Imports all home modules

  imports = [
    # Reusable modules
    (modulesPath + /home/hyprland-keybinds.nix)
    (modulesPath + /home/kitty.nix)
    (modulesPath + /home/firefox.nix)

    # Flavor-specific configs
    ./hyprland.nix
    ./wallpaper.nix
    ./apps.nix
  ];
}
