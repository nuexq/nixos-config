{ ... }:
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    LIBVA_DRIVER_NAME = "radeonsi";
    VDPAU_DRIVER = "radeonsi";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = 1;
    DIRENV_LOG_FORMAT = "";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    EDITOR = "nvim";
    VISUAL = "nvim";
    # GTK
    GTK_THEME = "catppuccin-mocha-mauve-standard";
    GTK_USE_PORTAL = "1";
    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    DISABLE_QT5_COMPAT = 0;
    CALIBRE_USE_DARK_PALETTE = "1";
    HYPRSHOT_DIR = "~/Pictures/Screenshots";
  };
}
