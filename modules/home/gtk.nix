{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-emoji
    fantasque-sans-mono
    maple-mono.NF-unhinted
  ];

  gtk = {
    enable = true;
    font = {
      name = "Maple Mono NF";
      size = 12;
    };
    theme = {
      name = "Catppuccin";
      package = pkgs.catppuccin-gtk.override {
        colorVariants = [ "mocha" ];
        themeVariants = [ "mauve" ];
      };
    };
    iconTheme = {
      name = "Catppuccin";
      package = pkgs.catppuccin-papirus-folders.override { color = "black"; };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
