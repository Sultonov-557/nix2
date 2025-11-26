{ config, pkgs, ... }:

{
  # Audio Configuration using PipeWire
  # Modern audio server with PulseAudio and ALSA compatibility

  # Disable PulseAudio (we're using PipeWire instead)
  hardware.pulseaudio.enable = false;

  # Enable ALSA support
  sound.enable = true;

  # Real-time audio support
  security.rtkit.enable = true;

  # PipeWire configuration
  services.pipewire = {
    enable = true;

    # Enable compatibility layers
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  # Audio-related packages
  environment.systemPackages = with pkgs; [
    pavucontrol # PulseAudio volume control
    pamixer # CLI mixer for PulseAudio
  ];
}
