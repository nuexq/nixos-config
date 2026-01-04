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
    lowfi                             # Terminal low-fi mode
    man-pages                         # Extra man pages
    mpv                               # Video player
    nitch                             # System fetch utility
    onefetch                          # Git repo summary in terminal
    fastfetch                         # system information tool
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
    woomer                            # GitHub release fetcher for Wayland software
    yt-dlp-light                      # Lightweight YouTube downloader
    xdg-utils                         # Desktop integration utils (open files/URLs)
    cbonsai                           # Terminal screensaver (ASCII bonsai)
    cmatrix                           # Matrix effect in terminal
    pipes                             # Terminal pipes animation
    sl                                # Steam locomotive animation (for mistyped 'ls')
    tty-clock                         # CLI clock
    radare2                           # reverse engineering
  ];
}

