{ pkgs, ... }:
{
  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      # for begin able to edit threshold without sudo (used in my quickshell)
      extraRules = [
        {
          users = [ "nuexq" ];
          commands = [
            {
              command = "/run/current-system/sw/bin/tee /sys/class/power_supply/BAT0/charge_control_start_threshold";
              options = [ "NOPASSWD" ];
            }
            {
              command = "/run/current-system/sw/bin/tee /sys/class/power_supply/BAT0/charge_control_end_threshold";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];
    };
    pam.services.hyprlock = { };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
