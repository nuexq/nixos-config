{ pkgs, config, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
    maple-mono.NF-CN-unhinted
  ];

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    catppuccin = {
      enable = true;
      flavor = config.catppuccin.flavor;
      accent = config.catppuccin.accent;
      size = "standard";
      tweaks = [ "rimless" "normal" ];
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 22;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 22;
  };

  home.sessionVariables = {
    GTK_THEME = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-standard+rimless,normal";
  };
}
