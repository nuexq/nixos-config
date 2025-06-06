{ inputs, ... }: {
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    hyprlock.enable = false;
    swaync.enable = false;
    hyprland.enable = false;
    starship.enable = false;
    zsh-syntax-highlighting.enable = false;
    tmux.enable = false;
  };
}
