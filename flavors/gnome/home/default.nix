{ ... }:

{
  home.stateVersion = "24.05";

  # Minimal GNOME settings can go here
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
