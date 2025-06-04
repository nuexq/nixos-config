{ pkgs, inputs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
    maple-mono.NF-CN-unhinted
  ];

  gtk = {
    enable = true;
    font = {
      name = "Maple Mono NF CN";
      size = 12;
    };

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
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
    GTK_THEME = "catppuccin-mocha-mauve-standard+rimless,normal";
  };
}
