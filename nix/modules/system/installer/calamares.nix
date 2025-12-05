{ pkgs, ... }:

{
  services.xserver.desktopManager.plasma5.enable = true;

  environment.systemPackages = with pkgs; [
    calamares-nixos
    calamares-nixos-extensions
  ];

  services.calamares = {
    enable = true;
    settings = {
      modules-search = [ "local" ];
      instances = [ ];

      sequence = {
        show = [
          "welcome"
          "locale"
          "keyboard"
          "partition"
          "users"
          "summary"
        ];
        exec = [
          "partition"
          "mount"
          "unpackfs"
          "machineid"
          "fstab"
          "locale"
          "keyboard"
          "localecfg"
          "users"
          "displaymanager"
          "networkcfg"
          "hwclock"
          "services-systemd"
          "bootloader"
          "umount"
        ];
      };

      branding = "nixos";
      prompt-install = true;
      dont-chroot = false;
    };
  };

  system.activationScripts.installerDesktop = ''
    mkdir -p /home/nixos/Desktop
    cat > /home/nixos/Desktop/calamares.desktop << EOF
    [Desktop Entry]
    Type=Application
    Exec=sudo -E calamares
    Name=Install NixOS
    Icon=calamares
    Terminal=false
    Categories=System;
    EOF
    chmod +x /home/nixos/Desktop/calamares.desktop
    chown nixos:users /home/nixos/Desktop/calamares.desktop
  '';
}
