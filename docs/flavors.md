# 🎨 Flavors: The Soul of Your OS

Welcome to the heart of Nixul. **Flavors** are what make this project special. They're more than just themes—they're complete personalities for your operating system.

## What is a Flavor?

A Flavor is a pre-configured set of visual and functional elements that can be applied to your entire system. When you switch Flavors, you're not just changing your wallpaper; you're changing:

*   **Color Palettes:** Consistent colors across your terminal, UI elements, and even your text editor.
*   **Desktop Components:** Different bars (like `dankMaterialShell` or `caelestia-shell`), docks, and application launchers.
*   **Wallpapers and Icons:** A curated aesthetic that ties everything together.
*   **Application-Specific Themes:** We do our best to theme everything, from GTK apps to Nixvim.

The goal is to create a seamless, immersive experience out of the box. You pick the vibe, and Nixul does the rest.

## Available Flavors

Here are the Flavors currently available in Nixul. We're always working on more!

### 🐱 Catppuccin

**Vibe:** Cozy, pastel, and comfortable.

The beloved `catppuccin` color scheme, applied system-wide. This Flavor is perfect for late-night coding sessions, focused work, and anyone who loves a warm, gentle aesthetic.

*   **UI:** Minimal and clean.
*   **Shell:** `caelestia-shell` for a sleek, modern prompt.
*   **Wallpaper:** A custom `catppuccin`-themed wallpaper.

### 🍎 macOS

**Vibe:** Sleek, simple, and minimalist.

Inspired by the clean design of macOS, this Flavor gives you a polished and professional-looking desktop. It's designed for productivity and focus.

*   **UI:** A top bar and dock reminiscent of macOS.
*   **Shell:** `dankMaterialShell` for a powerful, feature-rich shell.
*   **Wallpaper:** Light and dark wallpapers that match the theme.

## How to Switch Flavors

Changing your Flavor is as easy as editing a single line of code.

1.  Open your `flake.nix` file.
2.  Find your host configuration under `nixosConfigurations`.
3.  Change the `flavor` attribute to the name of the Flavor you want to use.
4.  Rebuild your system: `sudo nixos-rebuild switch --flake .#your-hostname`

That's it! Your system will transform on the next boot.
