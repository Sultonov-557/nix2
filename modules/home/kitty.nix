{ config, pkgs, ... }:

{
  # Kitty Terminal Configuration
  # GPU-accelerated terminal emulator
  # Theme is managed by Stylix

  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    settings = {
      # Appearance
      background_opacity = "0.9";
      background_blur = 1;

      # Stylix will handle colors automatically

      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";

      # Window
      window_padding_width = 8;
      confirm_os_window_close = 0;

      # Tab bar
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };
  };
}
