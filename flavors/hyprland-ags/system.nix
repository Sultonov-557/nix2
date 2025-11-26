{ config, pkgs, ... }:

{
  # Hyprland + AGS Flavor - System Configuration
  # Imports building blocks and adds flavor-specific settings

  imports = [
    ../../modules/system/hyprland.nix
    ../../modules/system/audio.nix
    ../../modules/system/fonts.nix
    ../../modules/shared/stylix.nix
  ];

  # Display manager (greetd with tuigreet)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # Additional Wayland/Hyprland utilities
  environment.systemPackages = with pkgs; [
    # File manager
    xfce.thunar

    # Application launcher
    rofi-wayland

    # Brightness control
    brightnessctl

    # Image viewer
    imv

    # PDF viewer
    zathura
  ];

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
