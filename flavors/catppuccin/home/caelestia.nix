{ inputs, ... }: {
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];

  programs.caelestia = {
    enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    settings = {
      bar = { status = { showBattery = true; }; };
      paths = { wallpaperDir = "~/Pictures/Wallpapers"; };
    };

    cli = {
      enable = true;
      settings = { theme = { enableGtk = true; }; };
    };
  };

  # Ensure wallpaper directory exists
  home.file."Pictures/Wallpapers/.keep".text = "";
}
