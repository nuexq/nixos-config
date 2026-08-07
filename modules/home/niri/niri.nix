{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    awww
    mpvpaper
    hyprpicker
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    swayosd
  ];

  systemd.user.targets.niri-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  programs.niri = {
    settings = {
      prefer-no-csd = true;

      input = {
        keyboard = {
          xkb = {
            layout = "us,ara";
            options = "grp:win_space_toggle";
          };
          repeat-delay = 300;
        };

        touchpad = {
          tap = true;
          natural-scroll = true;
          accel-profile = "flat";
        };

        mouse = {
          accel-profile = "flat";
        };

        warp-mouse-to-focus.enable = false;
      };

      outputs = {
        "eDP-1" = {
          enable = true;
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
      };

      layout = {
        gaps = 8;

        center-focused-column = "never";
        background-color = "transparent";

        preset-column-widths = [
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 1.0; }
        ];
        default-column-width = {
          proportion = 0.5;
        };

        focus-ring = {
          enable = true;
          width = 1;
          active.color = "#585b70";
          inactive.color = "#181825";
        };

        insert-hint = {
          enable = true;
          display = {
            color = "#cba6f780";
          };
        };
        tab-indicator = {
          enable = true;
          width = 4;
          length.total-proportion = 0.25;
          active.color = "#cdd6f4";
          inactive.color = "#585b70";
        };

        shadow.enable = false;
      };

      animations = {
        slowdown = 0.66667;
      };

      cursor = {
        theme = "phinger-cursors-dark";
        size = 15;
        hide-when-typing = true;
      };

      overview = {
        workspace-shadow.enable = false;
        zoom = 0.375;
        backdrop-color = "#11111b";
      };

      hotkey-overlay = {
        skip-at-startup = true;
      };

      screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d-%H-%M-%S.png";

      gestures = {
        hot-corners.enable = false;
      };

      spawn-at-startup = [
        {
          command = [
            "dbus-update-activation-environment"
            "--systemd"
            "WAYLAND_DISPLAY"
            "XDG_CURRENT_DESKTOP"
          ];
        }
        {
          command = [
            "systemctl"
            "--user"
            "import-environment"
            "WAYLAND_DISPLAY"
            "XDG_CURRENT_DESKTOP"
          ];
        }
        { command = [ "nm-applet" ]; }
        { command = [ "poweralertd" ]; }
        {
          command = [
            "wl-clip-persist"
            "--clipboard"
            "both"
          ];
        }
        {
          command = [
            "wl-paste"
            "--watch"
            "cliphist"
            "store"
          ];
        }
        { command = [ "waybar" ]; }
        { command = [ "swaync" ]; }
        { command = [ "awww-daemon" ]; }
        { command = [ "hypridle" ]; }
        { command = [ "swayosd-server" ]; }
        {
          command = [
            "vicinae"
            "server"
          ];
        }
        {
          command = [
            "ghostty"
            "--gtk-single-instance=true"
            "--quit-after-last-window-closed=false"
            "--initial-window=false"
          ];
        }
      ];

      window-rules = [
        {
          matches = [
            {
              app-id = "^(imv|org\\.gnome\\.Calculator|org\\.gnome\\.FileRoller|org\\.pulseaudio\\.pavucontrol|waypaper|zenity|SoundWireServer|file_progress|confirm|dialog|download|notification|error|confirmreset)$";
            }
            {
              title = "^(Volume Control|Picture-in-Picture|Open File|Open Files|File Upload|All Files|branchdialog|Confirm to replace files|File Operation Progress)$";
            }
          ];
          open-floating = true;
        }
        {
          matches = [ { title = "^Volume Control$"; } ];
          open-floating = true;
          default-column-width = {
            fixed = 700;
          };
          default-window-height = {
            fixed = 450;
          };
        }
        {
          matches = [ { title = "^Vicinae Launcher$"; } ];
          open-floating = true;
        }
      ];
    };
  };
}
