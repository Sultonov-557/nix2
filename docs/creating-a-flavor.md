# 🛠️ Creating a Flavor

So you've got an idea for a new vibe? Awesome. We built Nixul to be extended by the community, and we'd love to see what you come up with. Creating a new Flavor is easier than you might think.

This guide will walk you through the process of creating your own Flavor and sharing it with the world.

## The Basic Structure

A Flavor is just a directory inside `nix/flavors/`. The structure looks like this:

```
nix/flavors/
└── your-awesome-flavor/
    ├── default.nix
    ├── home/
    │   └── default.nix
    └── assets/
        └── wallpaper.png
```

*   `default.nix`: This is the entry point for your Flavor. It defines system-level packages and settings and imports the home-manager configuration.
*   `home/default.nix`: This is where you configure the user-level stuff, like the shell, GTK themes, and application-specific settings.
*   `assets/`: This is where you put any images, icons, or other assets your Flavor needs.

## Step 1: Create Your Flavor Directory

First, create a new directory for your Flavor in `nix/flavors/`.

```bash
mkdir nix/flavors/my-rad-flavor
mkdir nix/flavors/my-rad-flavor/home
mkdir nix/flavors/my-rad-flavor/assets
```

## Step 2: Create the `default.nix`

This file is where you'll define the core of your Flavor. You can copy one of the existing Flavors to get started.

Here's a basic template for `nix/flavors/my-rad-flavor/default.nix`:

```nix
{ ... }:

{
  name = "my-rad-flavor";
  description = "A description of your awesome new flavor.";

  specialisation = { pkgs, ... }: {
    # System-level settings go here
    # For example, enable a display manager
    services.displayManager.sddm.enable = true;

    # Add any system-wide packages your flavor needs
    environment.systemPackages = with pkgs; [
      rofi
      # ... other packages
    ];

    # Import the home-manager configuration for your flavor
    home-manager.users.your-username.imports = [ ./home ];
  };
}
```

**Important:** Remember to change `your-username` to your actual username.

## Step 3: Configure the Home Manager Part

Now, let's set up the user-level configuration in `nix/flavors/my-rad-flavor/home/default.nix`.

This is where you'll import modules for theming, shell configuration, and more.

```nix
{ ... }:

{
  imports = [
    # Import modules from the global modules directory
    ../../../modules/home/terminal/shell.nix
    ../../../modules/home/desktop/hyprland.nix

    # You can create flavor-specific config files and import them here
    # ./my-awesome-hyprland-config.nix
  ];

  # Set your Stylix theme
  stylix.image = ./../assets/wallpaper.png;
  stylix.scheme = "catppuccin-mocha"; # Or whatever scheme you want
}
```

## Step 4: Add Your Assets

Drop your wallpaper, icons, or other assets into the `nix/flavors/my-rad-flavor/assets/` directory.

## Step 5: Test Your Flavor

Now, it's time to test it out.

1.  Open your main `flake.nix`.
2.  Find your host in `nixosConfigurations`.
3.  Change the `flavor` attribute to the name of your new flavor (e.g., `"my-rad-flavor"`).
4.  Rebuild your system: `sudo nixos-rebuild switch --flake .#your-hostname`

If everything went well, you should see your new Flavor in action after a reboot!

## Step 6: Share It!

Once you're happy with your Flavor, open a Pull Request to add it to Nixul. We can't wait to see what you've created!
