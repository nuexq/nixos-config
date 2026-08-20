{ ... }:
{
  boot = {
    plymouth.enable = true;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
      timeout = 0;
    };

    initrd = {
      compressor = "zstd";
      verbose = false;
      systemd.enable = true;
    };

    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
}
