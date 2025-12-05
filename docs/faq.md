# 💬 Frequently Asked Questions

Got questions? We've got answers.

### Q: What exactly *is* Nixul?

**A:** Nixul is a NixOS-based configuration system. Think of it as a layer on top of NixOS that makes it easy to create beautiful, fully-themed desktop environments. It's not a standalone Linux distribution, but rather a "distro-like experience" built with Nix.

### Q: Do I need to know Nix to use it?

**A:** It helps, but it's not strictly necessary for basic use. If you just want to install and use a pre-existing Flavor, you only need to edit a single line in the `flake.nix`. If you want to create your own Flavors or customize things deeply, you'll need to learn some Nix.

### Q: Is Nixul stable?

**A:** Nixul is built on top of `nixos-unstable`. This means you get the latest and greatest packages, but it also means you might encounter an occasional bug. We do our best to keep things stable, but that's the nature of the unstable channel.

### Q: Can I use this on my existing NixOS setup?

**A:** Absolutely! Nixul is designed to be modular. You can import it as a flake in your own NixOS configuration and use its Flavors and modules.

### Q: How do I add my own packages or configurations?

**A:** You can add your own packages and configurations in your host-specific directory (`nix/hosts/your-hostname/`). This is the best place to put things that are unique to your machine.

### Q: How can I help?

**A:** We're so glad you asked! Check out our [contributing guide](./contributing.md) to learn how you can get involved.
