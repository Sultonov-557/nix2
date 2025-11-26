{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Global system settings (applied to ALL configurations)
    ../../global/system.nix
  ];

  # Host-specific settings
  networking.hostName = "example-host";

  # Boot loader configuration
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Hardware configuration
  # NOTE: For real hardware, generate with: nixos-generate-config
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  # Base Home Manager configuration (minimal console setup)
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.nixuser = {
      imports = [
        # Global home settings only (no desktop environment)
        ../../global/home.nix
      ];

      home.username = "nixuser";
      home.homeDirectory = "/home/nixuser";
    };

    extraSpecialArgs = { inherit inputs; };
  };

  # Specialisations: Different desktop flavors selectable from GRUB
  specialisations = {
    # Hyprland + AGS Desktop Flavor
    hyprland = {
      inheritParentConfig = true;

      configuration = {
        # Import Hyprland + AGS flavor system configuration
        imports = [
          ../../flavors/hyprland-ags/system.nix
        ];

        # Override home-manager for this specialisation
        home-manager.users.nixuser = {
          imports = [
            ../../global/home.nix
            ../../flavors/hyprland-ags/home.nix
          ];
        };
      };
    };

    # Future flavors can be added here, for example:
    # gnome = {
    #   inheritParentConfig = true;
    #   configuration = {
    #     imports = [ ../../flavors/gnome/system.nix ];
    #     home-manager.users.nixuser = {
    #       imports = [
    #         ../../global/home.nix
    #         ../../flavors/gnome/home.nix
    #       ];
    #     };
    #   };
    # };
  };
}
