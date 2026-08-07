{ pkgs, ... }: {
  services = {
    gvfs.enable = true;
    gnome = {
      tinysparql.enable = true;
      gnome-keyring.enable = true;
    };

    dbus = {
      enable = true;
      # needed for GNOME services outside of GNOME Desktop
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];
    };
    fstrim.enable = true;
  };
}
