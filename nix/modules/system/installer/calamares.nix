{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    calamares-nixos
    calamares-nixos-extensions
    gparted
  ];

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
