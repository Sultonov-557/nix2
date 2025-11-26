{ config, pkgs, ... }:

{
  # Font Configuration
  # Essential fonts for desktop environments

  fonts = {
    packages = with pkgs; [
      # Nerd Fonts (icons + programming fonts)
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "FiraCode"
          "Meslo"
        ];
      })

      # Standard fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      # Additional fonts
      liberation_ttf
      fira
      roboto

      # Microsoft fonts compatibility
      corefonts
      vistafonts
    ];

    # Font configuration
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [
          "Roboto"
          "Noto Sans"
        ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
