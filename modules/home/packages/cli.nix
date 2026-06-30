{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyperfine                         # benchmarking
    aoc-cli                           # Advent of Code command-line tool
    dysk                              # Disk information
    eza                               # ls replacement
    fd                                # find replacement
    ffmpeg                            # Audio/video converter and processor
    imv                               # Image viewer
    jq                                # JSON processor
    libnotify                         # Notifications library
    man-pages                         # Extra man pages
    mpv                               # Video player
    nitch                             # System fetch utility
    onefetch                          # Git repo summary in terminal
    pamixer                           # PulseAudio command-line mixer
    playerctl                         # Controller for media players
    poweralertd                       # Alerts when running on battery
    ripgrep                           # grep replacement
    shfmt                             # Bash formatter
    swappy                            # Snapshot editing tool
    tdf                               # CLI PDF viewer
    treefmt                           # Project-wide formatter
    tldr                              # Simplified man pages
    unzip                             # Extract .zip archives
    wl-clipboard                      # Clipboard utils for Wayland (wl-copy, wl-paste)
    wget                              # Command-line file downloader
    yt-dlp-light                      # Lightweight YouTube downloader
    xdg-utils                         # Desktop integration utils (open files/URLs)
    cmatrix                           # Matrix effect in terminal
    pipes                             # Terminal pipes animation
    tty-clock                         # CLI clock
    cliamp                            # music player
  ];
}

