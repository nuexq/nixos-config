{ username, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ara";

      displayManager.sddm.enable = true;

      displayManager.autoLogin.enable = false;
    };

    libinput.enable = true;
  };

  # Avoid long shutdown times
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}

