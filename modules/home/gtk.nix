{ pkgs, config, lib, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
    maple-mono.NF-CN-unhinted
    inter-nerdfont
  ];

  gtk = {
    enable = true;
    font = {
      name = "Inter Nerd Font";
      size = 12;
    };

    theme = {
      name =
        "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-standard";
      package = pkgs.catppuccin-gtk.override {
        size = "standard";
        accents = [ "mauve" ];
        variant = "mocha";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = lib.mkForce pkgs.catppuccin-papirus-folders;
    };
  };

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 22;
    gtk.enable = true;
  };

  home.sessionVariables = {
    GTK_THEME =
      "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-standard";
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE = "22";
  };
}
