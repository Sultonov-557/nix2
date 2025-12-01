{ ... }:

{
  imports = [
    ../../../modules/home/nixvim
    ../../../modules/home/ghostty.nix
    ../../../modules/home/hyprland.nix

    ../../../modules/home/shell.nix
    ../../../modules/home/git.nix
    ../../../modules/home/screenshots.nix
    ../../../modules/home/notifications.nix
    ../../../modules/home/firefox.nix
    ../../../modules/home/spicetify.nix

    ./stylix.nix
    ./nixvim.nix
    ./caelestia.nix

    ./hyprland/settings.nix
    ./hyprland/keybinds.nix
    ./hyprland/rules.nix
  ];
}
