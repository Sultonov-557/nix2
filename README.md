# Modular NixOS Flake with Building Blocks

A complete, minimal, and highly modular NixOS Flake configuration using building blocks pattern and GRUB boot menu flavor switching.

## Features

✅ **Building Blocks Architecture**: Reusable modules for maximum flexibility  
✅ **GRUB Boot Menu Switching**: Select desktop flavors at boot time  
✅ **Hyprland + AGS**: Modern Wayland compositor with AGS widgets  
✅ **Clean Separation**: Global → Modules → Flavors → Hosts  
✅ **Easy Expansion**: Add new window managers/DEs without touching existing code  

## Directory Structure

```
/
├── flake.nix                         # Main flake definition
├── hosts/
│   └── example-host/
│       └── configuration.nix         # Host config with specialisations
├── global/
│   ├── system.nix                    # Global system settings
│   └── home.nix                      # Global user settings
├── modules/                          # Building blocks
│   ├── system/
│   │   ├── hyprland.nix             # Hyprland compositor
│   │   ├── audio.nix                # PipeWire audio
│   │   └── fonts.nix                # Font configuration
│   ├── home/
│   │   ├── hyprland-keybinds.nix    # Hyprland keybindings
│   │   ├── ags.nix                  # AGS (Aylur's GTK Shell)
│   │   ├── kitty.nix                # Kitty terminal
│   │   └── firefox.nix              # Firefox browser
│   └── shared/
│       └── stylix.nix               # System-wide theming
└── flavors/
    └── hyprland-ags/                # Hyprland + AGS flavor
        ├── system.nix               # Imports building blocks
        └── home.nix                 # Imports building blocks
```

## Architecture Explained

### Layer Hierarchy

```
┌─────────────────────────────────────┐
│         1. Global Layer             │  ← Applied to ALL systems
│    (timezone, locale, base users)   │
└─────────────────────────────────────┘
              ↓
┌─────────────────────────────────────┐
│      2. Building Blocks Layer       │  ← Reusable components
│  (hyprland, audio, fonts, keybinds) │
└─────────────────────────────────────┘
              ↓
┌─────────────────────────────────────┐
│         3. Flavor Layer             │  ← Compose blocks + customize
│    (hyprland-ags, future: gnome)    │
└─────────────────────────────────────┘
              ↓
┌─────────────────────────────────────┐
│          4. Host Layer              │  ← Machine-specific + specialisations
│    (hostname, hardware, boot menu)  │
└─────────────────────────────────────┘
```

### How Specialisations Work

**GRUB Boot Menu:**
```
> NixOS                      ← Base system (console-only)
  NixOS (hyprland)          ← Hyprland + AGS desktop
  NixOS (older generations)
```

Each specialisation:
- Inherits the base configuration
- Adds its flavor's system and home modules
- Appears as a separate GRUB entry
- Can be selected at boot time

## Quick Start

### 1. Initial Setup

```bash
cd /home/sultonov/nixos2

# Lock flake inputs
nix flake lock

# Build the configuration
sudo nixos-rebuild switch --flake .#example-host
```

### 2. Boot into Hyprland

On next reboot, select **"NixOS (hyprland)"** from GRUB menu.

### 3. Hyprland Keybindings

| Key | Action |
|-----|--------|
| `SUPER + Return` | Open Kitty terminal |
| `SUPER + D` | Application launcher (rofi) |
| `SUPER + Q` | Close window |
| `SUPER + F` | Fullscreen |
| `SUPER + 1-9` | Switch workspace |
| `SUPER + SHIFT + 1-9` | Move to workspace |
| `SUPER + H/J/K/L` | Focus window (vim keys) |
| `SUPER + SHIFT + E` | Exit Hyprland |

See [hyprland-keybinds.nix](file:///home/sultonov/nixos2/modules/home/hyprland-keybinds.nix) for complete list.

## Adding a New Flavor

### Example: Adding GNOME

1. **Create flavor directory:**
```bash
mkdir -p flavors/gnome
```

2. **Create `flavors/gnome/system.nix`:**
```nix
{ config, pkgs, ... }:

{
  # Import relevant building blocks
  imports = [
    ../../modules/system/audio.nix
    ../../modules/system/fonts.nix
  ];
  
  # GNOME-specific configuration
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
```

3. **Create `flavors/gnome/home.nix`:**
```nix
{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/firefox.nix
  ];
  
  # GNOME-specific home config
  dconf.settings = {
    # Your GNOME settings
  };
}
```

4. **Add specialisation in `hosts/example-host/configuration.nix`:**
```nix
specialisations = {
  hyprland = { ... };  # existing
  
  # Add GNOME specialisation
  gnome = {
    inheritParentConfig = true;
    configuration = {
      imports = [ ../../flavors/gnome/system.nix ];
      home-manager.users.nixuser = {
        imports = [
          ../../global/home.nix
          ../../flavors/gnome/home.nix
        ];
      };
    };
  };
};
```

5. **Rebuild and reboot:**
```bash
sudo nixos-rebuild switch --flake .#example-host
reboot
```

Now GRUB will show **"NixOS (gnome)"** as an option!

## Creating New Building Blocks

### Example: Add Neovim module

**Create `modules/home/neovim.nix`:**
```nix
{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      telescope-nvim
      # ... more plugins
    ];
  };
}
```

**Use in any flavor:**
```nix
# In flavors/hyprland-ags/home.nix
imports = [
  ../../modules/home/neovim.nix  # Add this line
  # ... other imports
];
```

## Customization

### Change Color Scheme

Stylix themes your entire system. Edit [modules/shared/stylix.nix](file:///home/sultonov/nixos2/modules/shared/stylix.nix):

```nix
# Change to any base16 scheme:
base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
# Or use wallpaper-based theming:
# image = /path/to/wallpaper.png;
```

Available schemes: catppuccin-mocha, tokyo-night, gruvbox-dark-hard, nord, dracula, and many more!

### Modify Keybindings

Edit [modules/home/hyprland-keybinds.nix](file:///home/sultonov/nixos2/modules/home/hyprland-keybinds.nix) - changes apply to all flavors using Hyprland.

### Change Theme

Edit [flavors/hyprland-ags/home.nix](file:///home/sultonov/nixos2/flavors/hyprland-ags/home.nix) - only affects Hyprland flavor.

### Add Global Packages

Edit [global/system.nix](file:///home/sultonov/nixos2/global/system.nix) or [global/home.nix](file:///home/sultonov/nixos2/global/home.nix) - applies to ALL configurations including base.

## Included Components

### System Building Blocks
- **Hyprland**: Modern tiling Wayland compositor
- **Audio**: PipeWire with PulseAudio compatibility  
- **Fonts**: Nerd Fonts, Noto, system fonts

### Home Building Blocks
- **Hyprland Keybinds**: Complete keybinding configuration
- **AGS**: Widget system for bars and notifications
- **Kitty**: GPU-accelerated terminal (themed by Stylix)
- **Firefox**: Privacy-focused browser configuration

### Shared Modules
- **Stylix**: System-wide automatic theming with Catppuccin Mocha

### Hyprland + AGS Flavor
- **Display Manager**: greetd with tuigreet
- **Launcher**: rofi-wayland
- **File Manager**: Thunar
- **Theme**: Catppuccin Mocha with GTK integration
- **Utilities**: Screenshot (grim/slurp), clipboard, brightness control

## Tips

- **View all configurations:** `nix flake show`
- **Build without switching:** `sudo nixos-rebuild build --flake .#example-host`
- **Check for errors:** `nix flake check`
- **Update inputs:** `nix flake update`
- **AGS config location:** `~/.config/ags/` (you'll need to create your own)

## Requirements

- NixOS with flakes enabled
- UEFI boot (for systemd-boot)
- Internet connection for initial build

## Notes

- Default user: `nixuser` (password: `changeme`)
- Base system is minimal console-only
- Hardware configuration is placeholder - generate real one with `nixos-generate-config`
- AGS requires manual configuration in `~/.config/ags/` (not included in this template)

## File Organization

**When to create a building block:**
- Component is reusable across multiple flavors
- Configuration is self-contained
- Example: keybindings, terminal, browser

**When to put in flavor:**
- Flavor-specific customization
- Composition of multiple blocks
- Example: display manager choice, theme overrides

**When to put in global:**
- Applies to ALL systems regardless of flavor
- Example: timezone, base CLI tools, system users

---

**License:** This template is provided as-is for use in your NixOS configurations.
