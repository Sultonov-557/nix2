# 🐛 Troubleshooting

Hit a snag? Don't worry, it happens. Here are some common issues and how to solve them.

## Installation Issues

### `command not found: nixos-install`

If you get this error, it means you're not in the NixOS installation environment. Make sure you've booted from the NixOS USB drive.

### `error: experimental Nix feature 'nix-command' and 'flakes' is not enabled`

You need to enable Nix Flakes. The NixOS installer should have this enabled by default, but if you're running commands on your own machine, you may need to enable it in your `nix.conf`.

Add this to `/etc/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

### Build Failure During Installation

If the installation fails with a Nix build error, it's likely a problem with your configuration.

1.  **Check your `flake.nix`:** Double-check the hostname and flavor name.
2.  **Look at the error message:** Nix is usually good about telling you what went wrong. Look for clues in the build logs.
3.  **Open an issue:** If you're stuck, [open an issue](https://github.com/your-username/nixul/issues) and we'll help you out.

## Flavor Issues

### My Flavor Isn't Applying

If you've changed the flavor in your `flake.nix` but don't see the changes after a rebuild, here are a few things to check:

1.  **Did you use the right hostname?** Make sure you're rebuilding for the correct host (`sudo nixos-rebuild switch --flake .#your-hostname`).
2.  **Did you save the file?** It sounds simple, but we've all done it.
3.  **Is the flavor name correct?** The flavor name in `flake.nix` must match the directory name in `nix/flavors/`.

### My Icons or Theme Look Weird

This can happen if some applications are not correctly picking up the theme.

*   **GTK Apps:** Make sure you have `stylix` configured correctly in your flavor.
*   **Icons:** Some applications may have hardcoded icons. We do our best to theme everything, but some things are out of our control.

If you think you've found a theming bug, please let us know!
