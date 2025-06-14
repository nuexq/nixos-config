{ config, ... }: {
  programs.ghostty = {
    enable = true;

    settings = {

      theme = "catppuccin-${config.catppuccin.flavor}";
      font-family = "Maple Mono NF CN";
      font-size = 9;
      font-thicken = true;

      cursor-style = "block";
      cursor-style-blink = false;
      mouse-hide-while-typing = true;

      shell-integration = "zsh";
      shell-integration-features = "no-cursor";

      window-width = 120;
      window-height = 45;
      window-padding-x = 10;
      window-padding-y = 8;
      window-padding-color = "background";

      confirm-close-surface = false;
      clipboard-read = "allow";
      clipboard-paste-protection = false;

      gtk-tabs-location = "hidden";
      window-decoration = false;
    };
  };
}
