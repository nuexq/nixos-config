{ ... }: {
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    __GL_GSYNC_ALLOWED = 0;
    __GL_VRR_ALLOWED = 0;
    _JAVA_AWT_WM_NONEREPARENTING = 1;
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = 1;
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = 1;
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = 1;
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    EDITOR = "nvim";
    # GTK
    GTK_THEME =
      "Catppuccin-GTK-Purple-Dark";
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE = "22";
    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    DISABLE_QT5_COMPAT = 0;
    CALIBRE_USE_DARK_PALETTE = "1";
    HYPRSHOT_DIR = "~/Pictures/Screenshots";
  };
}
