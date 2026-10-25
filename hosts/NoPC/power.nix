{ ... }:
{
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    extraArgs = [ "--autopower" ];
  };

  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=1 power_save_controller=Y
  '';

  boot.kernelParams = [ "nowatchdog" ];

  services = {
    power-profiles-daemon.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    udev.extraRules = ''
      # Disable spurious wakeup from internal keyboard/trackpoint (serio0)
      ACTION=="add", SUBSYSTEM=="serio", DRIVER=="atkbd", ATTR{power/wakeup}="disabled"
    '';
  };

  systemd.tmpfiles.rules = [
    "w /sys/class/power_supply/BAT0/charge_control_start_threshold - - - - 70"
    "w /sys/class/power_supply/BAT0/charge_control_end_threshold - - - - 80"
  ];

}
