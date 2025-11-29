{
  wayland.windowManager.hyprland.settings = {
    monitor = ",preferred,auto,1";

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    exec-once = [
      "waybar"
      "hyprpaper"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgba(cba6f7ff) rgba(89b4faff) 45deg";
      "col.inactive_border" = "rgba(585b70ff)";
      resize_on_border = true;
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 0.95;

      blur = {
        enabled = true;
        size = 8;
        passes = 3;
        new_optimizations = true;
        vibrancy = 0.2;
      };

      drop_shadow = true;
      shadow_range = 20;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
    };

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_is_master = true;
    };

    gestures = {
      workspace_swipe = true;
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };

    input = {
      kb_layout = "us";
      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
      };

      sensitivity = 0;
    };
  };
}
