{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    noto-fonts-emoji
    maple-mono.NF-CN-unhinted
  ];

  gtk = {
    enable = true;
    font = {
      name = "JetBrain Nerd Font";
      size = 12;
    };
    theme = {
      name = "Colloid-Purple-Dark-Catppuccin";
      package = pkgs.colloid-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [ "purple" ];
        tweaks = [
          "catppuccin"
          "rimless"
          "float"
        ];
      };
    };
    iconTheme = {
      name = "catppuccin-papirus-folders-unstable";
      package = pkgs.catppuccin-papirus-folders;
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
