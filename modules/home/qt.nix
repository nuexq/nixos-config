{ ... }:

{

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  catppuccin.kvantum.apply = true;

  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_QPA_PLATFORM = "walyand;xcb";
    DISABLE_QT5_COMPAT = 0;
    CALIBRE_USE_DARK_PALETTE = "1";
  };
}

