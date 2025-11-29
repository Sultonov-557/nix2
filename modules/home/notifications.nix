{ ... }:

{
  services.mako = {
    enable = true;

    settings = {
      background-color = "#F5F5F5E6";
      text-color = "#1E1E1E";
      border-color = "#007AFF";
      progress-color = "over #007AFF";

      border-radius = 10;
      border-size = 2;

      width = 350;
      height = 100;
      margin = "10";
      padding = "15";

      default-timeout = 5000;

      font = "Inter 11";

      anchor = "top-right";

      layer = "overlay";
    };

    extraConfig = ''
      [urgency=high]
      border-color=#FF3B30
      default-timeout=0
    '';
  };
}
