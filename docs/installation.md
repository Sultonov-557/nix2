# 🚀 Installing Nixul

So, you're ready to jump in? Let's get you set up with Nixul. The process is pretty straightforward if you've ever touched NixOS. If not, don't worry, we'll walk you through it.

## Prerequisites

1. **A machine you want to install Nixul on.** This can be a bare-metal machine or a virtual machine.
2. **A bootable NixOS USB drive.** You can get the latest stable or unstable image from the [NixOS website](https://nixos.org/download.html).
3. **An internet connection.**
4. **A little bit of courage.** You're about to do something awesome.

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
mkdir -p /mnt/boot
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
