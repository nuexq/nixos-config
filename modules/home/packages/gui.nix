{ pkgs, ... }: {
  home.packages = with pkgs; [
    ## Multimedia
    obs-studio
    pavucontrol
    vlc

    qalculate-gtk
    qbittorrent

    ## Utility
    zenity
  ];
}
