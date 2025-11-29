{ ... }:

{
  imports = [
    ../../../modules/home/nixvim
    ../../../modules/home/ghostty.nix
    ../../../modules/home/hyprland.nix
    ./ghostty.nix
    ./hyprland/settings.nix
    ./hyprland/keybinds.nix
    ./hyprland/rules.nix
  ];

  home.stateVersion = "24.05";
}
