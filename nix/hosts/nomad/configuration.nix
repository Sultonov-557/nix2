{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../global/system
  ];

  networking.hostName = "nomad";

  home-manager = {
    users.sultonov = {
      imports = [
        ../../global/home
      ];

      home.username = "sultonov";
    };

    extraSpecialArgs = { inherit inputs; };
  };
}
