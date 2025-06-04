{
  inputs,
  pkgs,
  host,
  ...
}:
let
  ghostty = inputs.ghostty.packages.${pkgs.system}.default;
in
{
  home.packages = [ ghostty ];

  xdg.configFile."ghostty/config".text = ''
    # Font
    font-family = "Maple Mono NF CN"
    font-size = 9
    font-thicken = true

    adjust-underline-position = 40%
    adjust-underline-thickness = -60%

    cursor-style = block
    cursor-style-blink = false
    mouse-hide-while-typing = true

    shell-integration = zsh
    shell-integration-features = no-cursor

    window-width = 120
    window-height = 45
    window-padding-x = 4

    confirm-close-surface = false
    clipboard-read = allow
    clipboard-paste-protection = false
    unfocused-split-opacity = 1.0

    gtk-tabs-location = hidden
    window-decoration = false

    background-opacity = 1
    background-blur-radius = 20

    window-padding-x = 10
    window-padding-y = 8
    window-padding-color = extend
  '';
}
