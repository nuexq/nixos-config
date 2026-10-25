{ pkgs, ... }: {
  services = {
    gvfs.enable = true;
    gnome = {
      gnome-keyring.enable = true;
    };

    dbus = {
      enable = true;
      # needed for GNOME services outside of GNOME Desktop
      packages = with pkgs; [
        gcr_4
        gnome-settings-daemon
      ];
    };
    fstrim.enable = true;
  };
}
