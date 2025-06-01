{ ... }:
let
  browser = "zen-beta";
  terminal = "ghostty";
in
{
  wayland.windowManager.hyprland = {
    settings = {
      # autostart
      exec-once = [
        # "hash dbus-update-activation-environment 2>/dev/null"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

        "nm-applet &"
        "poweralertd &"
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar &"
        "swaync &"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
        "swww-daemon &"

        "hyprlock"

        "${terminal} --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
        "[workspace 1 silent] ${browser}"
        "[workspace 2 silent] ${terminal}"
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
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 3;
        gaps_out = 8;
        border_size = 1;
        "col.active_border" = "rgb(cdd6f4) rgb(585b70) 45deg";
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
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
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

        blur = {
          enabled = true;
          size = 2;
          passes = 5;
          ignore_opacity = true;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = false;
        };
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
        ];
      };

      binds = {
        movefocus_cycles_fullscreen = true;
      };

      bind = [
        # show keybinds list
        "$mainMod, F1, exec, show-keybinds"

        # keybindings
        "$mainMod, Return, exec, ${terminal} --gtk-single-instance=true"
        "$mainMod, B, exec, ${browser}"
        "$mainMod, Q, killactive,"
        "ALT, return, fullscreen"
        "$mainMod, W, exec, toggle-float"
        "ALT, Space, exec, rofi -show drun || pkill rofi"
        "$mainMod SHIFT, D, exec, discord --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod, Escape, exec, hyprlock"
        "$mainMod SHIFT, Escape, exec, power-menu"
        "$mainMod, D, togglesplit,"
        "$mainMod, E, exec, nemo"
        "ALT, E, exec, hyprctl dispatch exec '[float; size 1111 700] nemo'"
        "CTRL, ESCAPE, exec, toggle-waybar"
        "$mainMod, C ,exec, hyprpicker -a"
        #"$mainMod SHIFT, W,exec, wallpaper-picker"
        "$mainMod SHIFT, W,exec, hyprctl dispatch exec '[float; size 925 615] waypaper'"
        "$mainMod, N, exec, swaync-client -t -sw"
        "CTRL SHIFT, Escape, exec, hyprctl dispatch exec '[workspace 9] missioncenter'"
        "$mainMod, equal, exec, woomer"

        # screenshot
        ",Print, exec, screenshot --copy"
        "$mainMod, Print, exec, screenshot --save"
        "$mainMod SHIFT, Print, exec, screenshot --swappy"

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
        "$mainMod, V, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;} listview {columns: 1;}' | cliphist decode | wl-copy"
      ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
	"opacity 0.90 0.90,class:^(com.mitchellh.ghostty)$"
        "float,class:^(imv)$"
        "float,class:^(mpv)$"
        "float,class:^(Audacious)$"
        "pin,class:^(rofi)$"
        "pin,class:^(waypaper)$"
        "float,title:^(Volume Control)$"
        "size 700 450,title:^(Volume Control)$"
        "move 40 55%,title:^(Volume Control)$"

        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "opacity 1.0 override 1.0 override, class:(Aseprite)"
        "opacity 1.0 override 1.0 override, class:(zen)"
        "opacity 1.0 override 1.0 override, class:(evince)"
        "workspace 1, class:^(${browser})$"
        "workspace 3, class:^(evince)$"
        "workspace 5, class:^(Audacious)$"
        "workspace 5, class:^(Spotify)$"
        "workspace 8, class:^(com.obsproject.Studio)$"
        "workspace 10, class:^(discord)$"
        "idleinhibit focus, class:^(mpv)$"
        "float,class:^(org.gnome.Calculator)$"
        "float,class:^(waypaper)$"
        "float,class:^(zenity)$"
        "size 850 500,class:^(zenity)$"
        "size 725 330,class:^(SoundWireServer)$"
        "float,class:^(org.gnome.FileRoller)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(File Upload)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

        # "maxsize 1111 700, floating: 1"
        # "center, floating: 1"

        # Remove context menu transparency in chromium based apps
        "opaque,class:^()$,title:^()$"
        "noshadow,class:^()$,title:^()$"
        "noblur,class:^()$,title:^()$"

	# transparency
	"opacity 0.90 0.90,class:^(dev.zed.Zed)$"
	"opacity 0.80 0.80,class:^(discord)$"
	"opacity 0.80 0.80,class:^(Steam)$"
	"opacity 0.80 0.80,class:^(steam)$"
	"opacity 0.80 0.80,class:^(steamwebhelper)$"
	"opacity 0.85 0.85,class:^(Spotify)$"
	"opacity 0.90 0.90,class:^(Code)$"
	"opacity 0.90 0.90,class:^(code-url-handler)$"
	"opacity 0.90 0.90,class:^(com.mitchellh.ghostty)$"
	"opacity 0.80 0.80,class:^(nemo)$"
	"opacity 0.80 0.80,class:^(qt5ct)$"
	"opacity 0.80 0.80,class:^(qt6ct)$"
	"opacity 0.80 0.80,class:^(obsidian)$"
	"opacity 0.80 0.80,class:^(Notion)$"
      ];
    };

    extraConfig = "
      monitor=,1920x1080@60,auto,1

      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
