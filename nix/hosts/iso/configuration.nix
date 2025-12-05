{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../global/system
    ../../modules/system/installer/calamares.nix
    ../../modules/system/installer/live-environment.nix
  ];

  networking.hostName = "nixos-installer";

  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  isoImage.isoName = "nixos-hyprland.iso";
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;
  isoImage.squashfsCompression = "zstd -Xcompression-level 15";

  documentation.enable = false;
  documentation.nixos.enable = false;
}
