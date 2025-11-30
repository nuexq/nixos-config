{ config, ... }: {

  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono NF CN";
      size = 9;
    };
    extraConfig = ''
      window_padding_width 6.0
    '';
  };

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

      shell-integration = "fish";
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

      keybind = [
        "alt+1=unbind"
        "alt+2=unbind"
        "alt+3=unbind"
        "alt+4=unbind"
        "alt+5=unbind"
        "alt+6=unbind"
        "alt+7=unbind"
        "alt+8=unbind"
        "alt+9=unbind"
      ];
    };
  };
}
