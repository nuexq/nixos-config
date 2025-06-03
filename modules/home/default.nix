{ ... }:
{
  imports = [
    ./bat.nix                         # better cat command
    ./browser.nix                     # firefox based browser
    ./btop.nix                        # resouces monitor 
    ./cava.nix                        # audio visualizer
    ./discord.nix                     # discord
    ./fastfetch.nix                   # fetch tool
    ./flow.nix                        # terminal text editor
    ./fzf.nix                         # fuzzy finder
    ./gaming.nix                      # packages related to gaming
    ./ghostty.nix                     # terminal
    ./git.nix                         # version control
    ./gnome.nix                       # gnome apps
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./lazygit.nix
    ./nemo.nix                        # file manager
    ./nvim.nix                        # neovim editor
    ./obsidian.nix
    ./packages                        # other packages
    ./rofi.nix                        # launcher
    ./scripts/scripts.nix             # personal scripts
    ./ssh.nix                         # ssh config
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    ./waybar                          # status bar
    ./waypaper.nix                    # GUI wallpaper picker
    ./xdg-mimes.nix                   # xdg config
    ./zsh                             # shell
    ./yazi.nix                        # tui file-manager
    ./starship.nix
    ./minecraft.nix                   # minecraft
  ];
}
