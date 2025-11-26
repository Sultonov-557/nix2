{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Stylix - System-wide Theming
  # Automatic styling for applications based on wallpaper or base16 scheme

  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;

    # Base16 color scheme (you can change this to any base16 scheme)
    # Popular options: catppuccin-mocha, tokyo-night, gruvbox-dark-hard, nord, etc.
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # Wallpaper (optional - can also use image)
    # image = /path/to/your/wallpaper.png;
    # If wallpaper is set, Stylix will generate colors from it

    # Fonts configuration (uses fonts defined in fonts.nix)
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
        terminal = 11;
        desktop = 10;
        popups = 10;
      };
    };

    # Cursor theme
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    # Opacity settings
    opacity = {
      terminal = 0.9;
      applications = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };

    # Enable polarity (dark/light mode)
    polarity = "dark";
  };
}
