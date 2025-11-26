{ pkgs, ... }:

{
  # Hyprland System Configuration
  # Enables Hyprland compositor with necessary system-level dependencies

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable XDG Desktop Portal for screen sharing, file pickers, etc.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  # Required packages for Hyprland
  environment.systemPackages = with pkgs; [
    # Wayland utilities
    wl-clipboard
    wlr-randr

    # Screenshot and screen recording
    grim
    slurp

    # Notification daemon
    mako
  ];

  # Enable polkit for privilege escalation
  security.polkit.enable = true;

  # Enable dconf for GTK applications
  programs.dconf.enable = true;
}
