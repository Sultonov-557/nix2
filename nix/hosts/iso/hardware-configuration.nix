{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = true;

  fileSystems."/" = {
    fsType = "tmpfs";
    options = [ "mode=0755" ];
  };
}
