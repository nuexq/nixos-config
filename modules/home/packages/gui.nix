{ pkgs, ... }: {
  home.packages = with pkgs; [
    obs-studio
    pavucontrol
    vlc

    (lib.hiPrio libnotify)
    miru

    qalculate-gtk
    qbittorrent

    zenity
  ];
}

