{ pkgs, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    vlc

    (lib.hiPrio libnotify)
    miru

    qalculate-gtk
    qbittorrent

    zenity
    activitywatch
  ];
}

