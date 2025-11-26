{
  pkgs,
  inputs,
  ...
}:

{
  # AGS (Aylur's GTK Shell) Configuration
  # Modern widget system for status bars, notifications, and more

  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # Additional packages needed by AGS
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  # AGS configuration will be created in ~/.config/ags/
  # Basic packages for AGS functionality
  home.packages = with pkgs; [
    # For system info widgets
    brightnessctl
    # For media controls
    playerctl
    # For network info
    networkmanager
  ];
}
