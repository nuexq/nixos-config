{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    awww
    mpvpaper
    inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
    slurp
    hyprshot
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    xwayland = {
      enable = true;
    };
    systemd.enable = true;
  };
}
