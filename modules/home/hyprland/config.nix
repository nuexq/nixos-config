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
        "$mainMod" = "SUPER";
        "$hyper" = "SUPER CTRL ALT SHIFT";
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
        "$mainMod, F1, exec, vicinae 'vicinae://extensions/sovereign/hypr-keybinds/hyprland-keybinds'"

        # keybindings
        "$mainMod, H, exec, ghostty -e btop"
        "$mainMod, Return, exec, ${terminal} --gtk-single-instance=true" # open terminal
        "$mainMod, B, exec, ${browser}" # open browser
        "$mainMod, Q, killactive," # kill active app
        "ALT, return, fullscreen" # go full screen mode
        "$mainMod, W, exec, toggle-float"
        "ALT, Space, exec, vicinae toggle"
        "$mainMod SHIFT, D, exec, vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod, Escape, exec, hyprlock"
        "$mainMod SHIFT, Escape, exec, vicinae 'vicinae://toggle?fallbackText=power%20management'"
        "$mainMod, D, togglesplit," # toggle split
        "$mainMod, E, exec, nemo"
        "ALT, E, exec, hyprctl dispatch exec '[float; size 1111 700] nemo'"
        "ALT, Escape, exec, toggle-waybar"
        "$mainMod, C, exec, hyprpicker -a"
        "$mainMod SHIFT, W, exec, vicinae vicinae://extensions/sovereign/awww-switcher/wpgrid"
        "$mainMod, N, exec, swaync-client -t -sw"
        "$mainMod, equal, exec, woomer"

        # screenshot 
        ",Print, exec, screenshot --fullscreen" # Fullscreen screenshot instantly
        "$mainMod, Print, exec, screenshot --nonfreeze-copy" # Non-freeze + select area → copy
        "$hyper, S, exec, screenshot --freeze-copy" # Freeze + select area → copy

        # switch focus
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        "$mainMod, left,  alterzorder, top"
        "$mainMod, right, alterzorder, top"
        "$mainMod, up,    alterzorder, top"
        "$mainMod, down,  alterzorder, top"
        "$mainMod, h, alterzorder, top"
        "$mainMod, j, alterzorder, top"
        "$mainMod, k, alterzorder, top"
        "$mainMod, l, alterzorder, top"

        "CTRL ALT, up, exec, hyprctl dispatch focuswindow floating"
        "CTRL ALT, down, exec, hyprctl dispatch focuswindow tiled"

        # switch workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod CTRL, c, movetoworkspace, empty"

        # Move active window to a workspace silently
        "$mainMod ALT, 1, movetoworkspacesilent, 1"
        "$mainMod ALT, 2, movetoworkspacesilent, 2"
        "$mainMod ALT, 3, movetoworkspacesilent, 3"
        "$mainMod ALT, 4, movetoworkspacesilent, 4"
        "$mainMod ALT, 5, movetoworkspacesilent, 5"
        "$mainMod ALT, 6, movetoworkspacesilent, 6"
        "$mainMod ALT, 7, movetoworkspacesilent, 7"
        "$mainMod ALT, 8, movetoworkspacesilent, 8"
        "$mainMod ALT, 9, movetoworkspacesilent, 9"
        "$mainMod ALT, 0, movetoworkspacesilent, 10"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod CTRL, left, resizeactive, -40 0"
        "$mainMod CTRL, right, resizeactive, 40 0"
        "$mainMod CTRL, up, resizeactive, 0 -40"
        "$mainMod CTRL, down, resizeactive, 0 40"
        "$mainMod CTRL, h, resizeactive, -40 0"
        "$mainMod CTRL, j, resizeactive, 0 40"
        "$mainMod CTRL, k, resizeactive, 0 -40"
        "$mainMod CTRL, l, resizeactive, 40 0"

        "$mainMod ALT, left, moveactive,  -40 0"
        "$mainMod ALT, right, moveactive, 40 0"
        "$mainMod ALT, up, moveactive, 0 -40"
        "$mainMod ALT, down, moveactive, 0 40"
        "$mainMod ALT, h, moveactive,  -40 0"
        "$mainMod ALT, j, moveactive, 0 40"
        "$mainMod ALT, k, moveactive, 0 -40"
        "$mainMod ALT, l, moveactive, 40 0"

        # Special workspaces (scratchpad)
        "$mainMod ALT, S, movetoworkspacesilent, special"
        "$mainMod, S, togglespecialworkspace,"

        # media and volume controls
        # ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop,exec, playerctl stop"

        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"

        # clipboard manager
        "$mainMod, V, exec, vicinae vicinae://extensions/vicinae/clipboard/history"
      ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
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
      ];

      layerrule =
        [ "match:namespace vicinae, blur on, ignore_alpha 0, no_anim on" ];
    };

    extraConfig =
      "\n      monitor=,1920x1080@60,auto,1\n\n      xwayland {\n        force_zero_scaling = true\n      }\n    ";
  };
}
