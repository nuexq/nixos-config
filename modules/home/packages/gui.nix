{ pkgs, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    vlc

    qalculate-gtk # calculator
    qbittorrent # BitTorrent client

    zenity
    anki

    file-roller # archive
  ];

  programs.zathura.enable = true;
}

