{ ... }:

{
  name = "catppuccin";
  description = "Hyprland with Catppuccin theme and caelestia-shell";

  specialisation = { pkgs, ... }: {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      rofi
      hyprpaper
      nautilus
      brightnessctl
      pamixer
      playerctl
      hyprpicker
    ];

    home-manager.users.sultonov.imports = [ ./home ];
  };
}
