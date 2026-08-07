{ ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ara";
    };
    displayManager.autoLogin.enable = false;
    libinput.enable = true;
  };
}
