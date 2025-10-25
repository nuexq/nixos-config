{ pkgs, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    vlc

    qalculate-gtk # calculator
    qbittorrent # BitTorrent client

    zenity
    ghidra # reverse-engineering software (static)
    (cutter.withPlugins (ps: with ps; [ jsdec rz-ghidra sigdb ]))
    anki-bin
  ];
}

