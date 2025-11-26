{
  pkgs,
  inputs,
  ...
}:

{
  programs.zen-browser = {
    enable = true;
    package = inputs.zen-browser.packages."${pkgs.system}".beta;
  };

  programs.zen-nebula = {
    enable = true;
    profile = "Default";
    zenConfigPath = ".zen";
  };
}
