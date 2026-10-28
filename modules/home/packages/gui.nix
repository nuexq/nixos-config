{ pkgs, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    vlc

    qalculate-gtk # calculator
    qbittorrent # BitTorrent client

    zenity
    anki

    file-roller # archive

    thunderbird # email

    gammaray

    sable
  ];

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };
}
