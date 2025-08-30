{ pkgs, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    vlc

    qalculate-gtk
    qbittorrent

    zenity
  ];
}

