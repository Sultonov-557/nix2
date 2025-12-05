{ ... }:

{
  imports = [
    # Essential Tools
    ../../modules/home/terminal/ghostty.nix
    ../../modules/home/terminal/shell.nix
    ../../modules/home/terminal/git.nix
    ../../modules/home/utils/archives.nix
    ../../modules/home/utils/btop.nix

    # Hyprland Configuration
    ../../modules/home/desktop/hyprland.nix

  ];
}
