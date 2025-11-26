{ config, pkgs, ... }:

{
  # Global system settings applied to ALL hosts
  # These are non-desktop-related essential settings
  
  # Timezone configuration
  time.timeZone = "UTC";
  
  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Create initial user
  users.users.nixuser = {
    isNormalUser = true;
    description = "NixOS User";
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "changeme";
  };
  
  # Allow unfree packages (if needed)
  nixpkgs.config.allowUnfree = true;
  
  # Basic system packages available everywhere
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
  ];
  
  # Enable NetworkManager
  networking.networkmanager.enable = true;
  
  # System state version
  system.stateVersion = "24.05";
}
