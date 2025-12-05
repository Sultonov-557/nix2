# 🚀 Installing Nixul

So, you're ready to jump in? Let's get you set up with Nixul. The process is pretty straightforward if you've ever touched NixOS. If not, don't worry, we'll walk you through it.

## Prerequisites

**Choose Your Path:**

### Option 1: Graphical ISO Installer (Recommended for Beginners)

If you're new to NixOS or prefer a graphical installation, you can use our custom Nixul ISO with Hyprland and a beautiful GUI installer.

**What you need:**
1. **A machine to install Nixul on** (bare-metal or VM).
2. **The Nixul ISO** (instructions below).
3. **A USB drive** (at least 4GB).
4. **An internet connection.**

**Quick Start:**
1. Build the ISO: `nix build github:Sultonov-557/nixul#iso`
2. Flash it to USB using `dd`, Etcher, or Ventoy
3. Boot from USB and follow the graphical installer

Skip to [ISO Installation](#iso-installation) for full details.

### Option 2: Manual Installation (For NixOS Veterans)

If you're comfortable with NixOS and want full control:

1. **A machine you want to install Nixul on.** This can be a bare-metal machine or a virtual machine.
2. **A bootable NixOS USB drive.** You can get the latest stable or unstable image from the [NixOS website](https://nixos.org/download.html).
3. **An internet connection.**
4. **A little bit of courage.** You're about to do something awesome.

---

## ISO Installation

### Step 1: Build or Download the ISO

Build the Nixul ISO:
```bash
nix build github:Sultonov-557/nixul#iso
```

The ISO will be in `result/iso/`.

### Step 2: Create a Bootable USB

Flash the ISO to a USB drive:

**Using dd (Linux):**
```bash
dd if=result/iso/nixos-hyprland.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

**Using Etcher (All platforms):** Download [balenaEtcher](https://www.balena.io/etcher/) and flash the ISO.

**Using Ventoy:** Simply copy the ISO file to your Ventoy USB drive.

### Step 3: Boot from USB

1. Insert the USB drive into your target machine
2. Boot from the USB (usually F12, F2, or DEL during startup to access boot menu)
3. Select the Nixul ISO from the boot menu

### Step 4: Use the Graphical Installer

You'll boot into a live Hyprland environment with auto-login. On the desktop, you'll find an "Install NixOS" icon.

1. **Launch the installer** by clicking the desktop icon
2. **Choose your language and keyboard layout**
3. **Partition your disk** (the installer provides a GUI for this)
4. **Create your user account** (this will be your main user)
5. **Configure your system** (hostname, timezone, etc.)
6. **Choose installation location** (the installer will use the Nixul configuration)
7. **Install!**

After installation, reboot into your new Nixul system with all flavors available as boot options!

---

## Manual Installation

### Step 1: Boot into the NixOS Installer

Boot your machine from the NixOS USB drive. You'll be dropped into a shell.

### Step 2: Prepare Your Disks

This is the most "manual" part of the process. You'll need to partition and format your drives. We can't give you the *exact* commands for this, as it depends on your drive setup (e.g., `/dev/sda`, `/dev/nvme0n1`).

A typical setup would be:

* A boot partition (1024MB, FAT32).
* A swap partition (if you want one).
* A root partition (the rest of the disk, ext4 or whatever you prefer).

Once you've partitioned and formatted, you'll need to mount your partitions to `/mnt`.

```bash
# Example for a simple setup:
mount /dev/disk/by-label/nixos /mnt
mount /dev/disk/by-label/boot /mnt/boot
```

### Step 3: Clone Nixul

Now, let's grab the Nixul source code.

```bash
git clone https://github.com/Sultonov-557/nixul.git /mnt/etc/nixos
cd /mnt/etc/nixos
```

**Note:** We're cloning it directly into `/mnt/etc/nixos`, which is where your configuration will live.

### Step 4: Configure Nixul

This is where the magic happens. You need to tell Nixul which machine and which Flavor you want to use.

1. **Choose a Host:** In the `nix/hosts` directory, you'll find different machine configurations. You can use one as a template or create your own. You'll need to update `nix/hosts/your-host/hardware-configuration.nix` by running `nixos-generate-config`.

    ```bash
    nixos-generate-config --root /mnt
    # This generates a hardware config, but we only want the hardware part.
    # Copy the contents of /mnt/etc/nixos/hardware-configuration.nix to nix/hosts/your-host/hardware-configuration.nix
    ```

2. **Choose a Flavor:** All flavors are available as specialisations in your bootloader menu. After installation, you can boot into any flavor you want!

### Step 5: Install

You're ready. Run the installer.

```bash
nixos-install --flake .#your-hostname
```

Replace `your-hostname` with the name of the host you configured (e.g., `home-pc`).

Once it's done, reboot, and you should be greeted by your brand new, Flavor-ful Nixul system.
