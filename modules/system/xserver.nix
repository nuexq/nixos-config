{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ara";
    };

    displayManager.autoLogin.enable = false;
    libinput.enable = true;
  };

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
