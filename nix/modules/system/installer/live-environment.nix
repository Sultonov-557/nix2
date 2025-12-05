{ pkgs, lib, ... }:

{
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
    password = "";
    description = "NixOS Live User";
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "nixos";
  };

  services.getty.autologinUser = lib.mkForce "nixos";

  networking.networkmanager.enable = true;
  networking.wireless.enable = lib.mkForce false;

  services.openssh.settings.PermitRootLogin = lib.mkForce "yes";

  environment.systemPackages = with pkgs; [
    gparted
    firefox
    ghostty
    nautilus
    networkmanagerapplet
    pavucontrol
    htop
    git
  ];

  home-manager.users.nixos = {
    imports = [ ../../../hosts/iso/home.nix ];

    home = {
      username = "nixos";
      homeDirectory = "/home/nixos";
      stateVersion = "24.11";
    };
  };

  system.stateVersion = "24.11";
}
