{ config, pkgs, ... }:

{
  # Global home-manager settings applied to ALL users
  # These are non-desktop-related essential user settings
  
  # Basic user packages
  home.packages = with pkgs; [
    vim
    tmux
    htop
    tree
    unzip
  ];
  
  # Git configuration
  programs.git = {
    enable = true;
    userName = "nixuser";
    userEmail = "nixuser@example.com";
  };
  
  # Bash configuration
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
  
  # Home state version
  home.stateVersion = "24.05";
}
