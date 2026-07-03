{ ... }: {
  services.wluma = {
    enable = true;
    settings = {
      als.none = { };
      output.backlight = [
        {
          name = "eDP-1";
          path = "/sys/class/backlight/amdgpu_bl1";
          capturer = "wayland";
        }
      ];
    };
  };
}
