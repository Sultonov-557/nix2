{ inputs, ... }:
{
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
    };
  };
}
