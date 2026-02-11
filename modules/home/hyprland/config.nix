{ ... }:
let
  browser = "zen-beta";
  terminal = "ghostty";
in {
  wayland.windowManager.hyprland = {
    settings = {
      # autostart
      exec-once = [
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

        "nm-applet &"
        "poweralertd &"
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar &"
        "swaync &"
        "hyprctl setcursor Bibata-Modern-Ice 20 &"
        "swww-daemon &"
        "hypridle &"

        "${terminal} --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
        "hyprctl dispatch exec '[workspace 1 silent] ${browser}'"
        "hyprctl dispatch exec '[workspace 2 silent] ${terminal}'"
        "hyprctl dispatch exec '[workspace 3 silent] vesktop'"
        "vicinae server"
      ];

      input = {
        kb_layout = "us,ara";
        kb_options = "grp:alt_caps_toggle";
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        mouse_refocus = 0;
        sensitivity = -1;
        force_no_accel = 1;
        touchpad = { natural_scroll = true; };
      };

      general = {
        layout = "dwindle";
        gaps_in = 3;
        gaps_out = 8;
        border_size = 1;
        "col.active_border" = "rgb(585b70) rgb(585b70) 45deg";
        "col.inactive_border" = "rgb(181825)";
        resize_on_border = true;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = false;
        middle_click_paste = false;
        disable_splash_rendering = true;
      };

      dwindle = {
        force_split = 2;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 0;
        dim_special = 0.3;

        blur = {
          enabled = true;
          size = 2;
          passes = 5;
          ignore_opacity = true;
          new_optimizations = true;
          xray = true;
          special = true;
        };

        shadow = { enabled = false; };
      };

      animations = {
        enabled = true;

        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];

        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
          "specialWorkspace, 1, 3, wind, fade"
        ];
      };

      debug = {
        full_cm_proto = true;
        disable_logs = false;
      };

      binds = { movefocus_cycles_fullscreen = true; };

      bind = [
        # show keybinds list
        "SUPER, F1, exec, vicinae 'vicinae://extensions/sovereign/hypr-keybinds/hyprland-keybinds'"

        # keybindings
        "SUPER, Return, exec, ${terminal} --gtk-single-instance=true" # open terminal
        "SUPER, B, exec, ${browser}" # open browser
        "SUPER, Q, killactive," # kill active app
        "ALT, return, fullscreen" # go full screen mode
        "SUPER, W, exec, toggle-float"
        "ALT, Space, exec, vicinae toggle"
        "SUPER SHIFT, D, exec, vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "SUPER, Escape, exec, hyprlock"
        "SUPER SHIFT, Escape, exec, vicinae 'vicinae://toggle?fallbackText=power%20management'"
        "SUPER, D, togglesplit," # toggle split
        "SUPER, E, exec, nemo"
        "ALT, E, exec, hyprctl dispatch exec '[float; size 1111 700] nemo'"
        "ALT, Escape, exec, toggle-waybar"
        "SUPER, C, exec, hyprpicker -a"
        "SUPER SHIFT, W, exec, vicinae vicinae://extensions/sovereign/awww-switcher/wpgrid"
        "SUPER, N, exec, swaync-client -t -sw"
        "SUPER, equal, exec, woomer"

        # screenshot 
        ",Print, exec, screenshot --fullscreen" # Fullscreen screenshot instantly
        "SUPER, Print, exec, screenshot --nonfreeze-copy" # Non-freeze + select area → copy
        "SUPER CTRL ALT SHIFT, S, exec, screenshot --freeze-copy" # Freeze + select area → copy

        # switch focus
        "SUPER, left,  movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up,    movefocus, u"
        "SUPER, down,  movefocus, d"
        "SUPER, h, movefocus, l"
        "SUPER, j, movefocus, d"
        "SUPER, k, movefocus, u"
        "SUPER, l, movefocus, r"

        "SUPER, left,  alterzorder, top"
        "SUPER, right, alterzorder, top"
        "SUPER, up,    alterzorder, top"
        "SUPER, down,  alterzorder, top"
        "SUPER, h, alterzorder, top"
        "SUPER, j, alterzorder, top"
        "SUPER, k, alterzorder, top"
        "SUPER, l, alterzorder, top"

        "CTRL ALT, up, exec, hyprctl dispatch focuswindow floating"
        "CTRL ALT, down, exec, hyprctl dispatch focuswindow tiled"

        # switch workspace
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"
        "SUPER CTRL, c, movetoworkspace, empty"

        # Move active window to a workspace silently
        "SUPER ALT, 1, movetoworkspacesilent, 1"
        "SUPER ALT, 2, movetoworkspacesilent, 2"
        "SUPER ALT, 3, movetoworkspacesilent, 3"
        "SUPER ALT, 4, movetoworkspacesilent, 4"
        "SUPER ALT, 5, movetoworkspacesilent, 5"
        "SUPER ALT, 6, movetoworkspacesilent, 6"
        "SUPER ALT, 7, movetoworkspacesilent, 7"
        "SUPER ALT, 8, movetoworkspacesilent, 8"
        "SUPER ALT, 9, movetoworkspacesilent, 9"
        "SUPER ALT, 0, movetoworkspacesilent, 10"

        # window control
        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"
        "SUPER SHIFT, h, movewindow, l"
        "SUPER SHIFT, j, movewindow, d"
        "SUPER SHIFT, k, movewindow, u"
        "SUPER SHIFT, l, movewindow, r"

        "SUPER CTRL, left, resizeactive, -40 0"
        "SUPER CTRL, right, resizeactive, 40 0"
        "SUPER CTRL, up, resizeactive, 0 -40"
        "SUPER CTRL, down, resizeactive, 0 40"
        "SUPER CTRL, h, resizeactive, -40 0"
        "SUPER CTRL, j, resizeactive, 0 40"
        "SUPER CTRL, k, resizeactive, 0 -40"
        "SUPER CTRL, l, resizeactive, 40 0"

        "SUPER ALT, left, moveactive,  -40 0"
        "SUPER ALT, right, moveactive, 40 0"
        "SUPER ALT, up, moveactive, 0 -40"
        "SUPER ALT, down, moveactive, 0 40"
        "SUPER ALT, h, moveactive,  -40 0"
        "SUPER ALT, j, moveactive, 0 40"
        "SUPER ALT, k, moveactive, 0 -40"
        "SUPER ALT, l, moveactive, 40 0"

        # Special workspaces (scratchpad)
        "SUPER ALT, S, movetoworkspacesilent, special"
        "SUPER, S, togglespecialworkspace,"

        # media and volume controls
        # ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop,exec, playerctl stop"

        "SUPER, mouse_down, workspace, e-1"
        "SUPER, mouse_up, workspace, e+1"

        # clipboard manager
        "SUPER, V, exec, vicinae vicinae://extensions/vicinae/clipboard/history"
      ];

      # mouse binding
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
        "match:float true, center on"
        # Floating
        "match:class imv|mpv|org.gnome.Calculator|org.gnome.FileRoller|org.pulseaudio.pavucontrol|waypaper|zenity|SoundWireServer|.sameboy-wrapped|file_progress|confirm|dialog|download|notification|error|confirmreset, float on"
        "match:title Volume Control|Picture-in-Picture|Open File|Open Files|File Upload|All Files|branchdialog|Confirm to replace files|File Operation Progress, float on"

        "match:title Volume Control, size 700 450"
        "match:class zenity, size 850 500"
        "match:class SoundWireServer, size 725 330"
        "match:class waypaper, pin on"
        "match:class anki, match:title Add, float on, size 929 558, center on"

        "match:class xwaylandvideobridge, opacity 0.0 override"
        "match:class dev.zed.Zed, opacity 0.90"

        "match:class vesktop|Steam|steam|steamwebhelper|Spotify|Code|code-url-handler|com.mitchellh.ghostty|nemo|qt5ct|qt6ct|obsidian, opacity 0.95"

        "match:title .*imv.*|.*mpv.*|Picture-in-Picture, opacity 1.0 override 1.0 override"
        "match:class Aseprite|zen|evince, opacity 1.0 override 1.0 override"

        "match:class xwaylandvideobridge, opacity 0.0 override"
        "match:class dev.zed.Zed, opacity 0.90"
        "match:class vesktop|Steam|steam|steamwebhelper|Spotify|Code|code-url-handler|com.mitchellh.ghostty|nemo|qt5ct|qt6ct|obsidian, opacity 0.95"
        "match:title .*imv.*, opacity 1.0 override 1.0 override"
        "match:title .*mpv.*, opacity 1.0 override 1.0 override"
        "match:class Aseprite|zen|evince, opacity 1.0 override 1.0 override"
        "match:title Picture-in-Picture, opacity 1.0 override 1.0 override"

        # Other effects
        "match:class mpv, idle_inhibit focus"
        "match:class xwaylandvideobridge, no_anim on, no_initial_focus on, max_size 1 1, no_blur on"
        "match:title Vicinae Launcher, no_anim on, pin on, border_size 0"
      ];

      layerrule =
        [ "match:namespace vicinae, blur on, ignore_alpha 0, no_anim on" ];
    };

    extraConfig =
      "\n      monitor=,1920x1080@60,auto,1\n\n      xwayland {\n        force_zero_scaling = true\n      }\n    ";
  };
}
