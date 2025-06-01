{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aoc-cli                           # Advent of Code command-line tool
    dysk                              # disk information
    eza                               # ls replacement
    fd                                # find replacement
    ffmpeg
    imv                               # image viewer
    jq                                # JSON processor
    libnotify
    lowfi
    man-pages                         # extra man pages
    mpv                               # video player
    nitch                             # systhem fetch util
    openssl
    onefetch                          # fetch utility for git repo
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    poweralertd
    programmer-calculator
    ripgrep                           # grep replacement
    shfmt                             # bash formatter
    swappy                            # snapshot editing tool
    tdf                               # cli pdf viewer
    treefmt                           # project formatter
    tldr
    unzip
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    woomer
    yt-dlp-light
    xdg-utils
    xxd

    cbonsai                           # terminal screensaver
    cmatrix
    pipes                             # terminal screensaver
    sl
    tty-clock                         # cli clock
  ];
}
