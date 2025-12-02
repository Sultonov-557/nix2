<div align="center">

```
 __   _  __  _  _  ____  _   
(  ) / T(  )( \/ )(  _ \( )  
 ) \/ \/ \\ \/ /  ) _ <| |  
 \__ /\____/ \__/  (____/(_)  
```

**Nixul: Your OS, Your Flavor.**

</div>

<div align="center">

[![Nix Flake Check](https://img.shields.io/github/actions/workflow/status/your-username/nixul/flake-check.yml?branch=main&label=Flake%20Check&style=for-the-badge)](https://github.com/your-username/nixul/actions/workflows/flake-check.yml)
[![License](https://img.shields.io/github/license/your-username/nixul?style=for-the-badge)](./LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/your-username/nixul?style=for-the-badge)](https://github.com/your-username/nixul/stargazers)
[![Discord](https://img.shields.io/discord/your-server-id?style=for-the-badge&logo=discord&label=Join%20Us)](https://discord.gg/your-invite-link)

</div>

Tired of boring, one-size-fits-all Linux distros? So were we.

**Nixul** is a new breed of operating system built on the power of NixOS. It's not just a distro; it's a canvas for your digital identity. The entire brand is built around **Flavors**—radically different themes, UIs, and vibes that you can switch between on the fly.

No more tweaking configs for hours to get the look you want. With Nixul, you choose a Flavor, and your entire system adapts.

---

### ✨ Features

*   **Flavor System:** Instantly change your system's entire aesthetic. From `catppuccin`'s cozy pastels to `macos`'s sleek minimalism, there's a Flavor for every mood.
*   **Built on Nix:** Leverage the power, reproducibility, and reliability of NixOS.
*   **Modular & Lightweight:** The base system is minimal. You only get what you need.
*   **Community-Driven:** Create and share your own Flavors with the community.
*   **Developer Friendly:** Comes with a pre-configured `nix-shell` for development.

---

### 🎨 What are Flavors?

A Flavor is more than just a theme. It's a complete personality for your OS. When you apply a Flavor, you're changing:

*   **Color Schemes:** System-wide, from your terminal to your GTK apps.
*   **Wallpapers & Icons:** A curated visual experience.
*   **UI Components:** Different bars, docks, and launchers.
*   **Shell & Prompts:** A shell that matches your style.

Think of it like swapping out the soul of your machine, without reinstalling anything.

**[➡️ Learn More About Flavors](./docs/flavors.md)**

---

### ⚙️ How It Works

Nixul uses a modular architecture built on top of NixOS and `flake-parts`. Flavors are self-contained modules that are imported by the main `flake.nix`.

Here's a simplified look at the architecture:

```
+-------------------------+
|      Your Host PC       |
|  (e.g., home-pc)        |
+-------------------------+
            |
            v
+-------------------------+
|      flake.nix          |
| (imports your chosen    |
|       Flavor)           |
+-------------------------+
            |
            v
+-----------+-------------+
|      Global Config      |
| (Base system packages)  |
+-------------------------+
            |
            v
+-----------+-------------+      +------------------+
|      Flavor Config      |----->|  Flavor Assets   |
| (e.g., catppuccin)      |      | (wallpapers, etc)|
+-------------------------+      +------------------+
```

When you build your system, Nix combines your host-specific configuration, the global configuration, and the selected Flavor to create a unified, fully-themed OS.

---

### 🚀 Installation

Ready to give it a spin? The installation is straightforward, especially if you're familiar with Nix.

1.  **Prepare a NixOS installation medium.**
2.  **Clone this repository.**
3.  **Configure your `flake.nix` to choose a host and flavor.**
4.  **Run the installer.**

For a full, step-by-step guide, check out our installation documentation.

**[➡️ Full Installation Guide](./docs/installation.md)**

---

### 💬 FAQ

*   **Is this a full Linux distro?** Kinda. It's a configuration system on top of NixOS.
*   **Can I create my own Flavor?** Absolutely! We encourage it.
*   **Is it stable?** It's as stable as NixOS Unstable. 😉

Have more questions? We've got answers.

**[➡️ Read the Full FAQ](./docs/faq.md)**

---

### 🗺️ Roadmap

Nixul is just getting started. Here's what we have planned:

*   **Automated ISO Builds:** Easy-to-install images for every Flavor.
*   **More Flavors:** We're always cooking up new styles.
*   **A Command-Line Flavor Switcher:** Change your vibe without touching a config file.
*   **Community Flavor Repository:** A place to share and discover new Flavors.

---

### 🙌 Contributing

Got an idea for a Flavor? Want to help build the future of Nixul? We'd love to have you.

Check out our contributing guide to get started.

**[➡️ How to Contribute](./docs/contributing.md)**
