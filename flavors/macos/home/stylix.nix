{ inputs, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    wallpaper = ../assets/wallpaper.jpg;
    polarity = "dark";
  };
}
