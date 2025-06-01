{ pkgs, ... }:
{
  home.packages = with pkgs; [ swayosd ];

  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [ "swayosd-server" ];

      bind = [ ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle" ];
      # binds active in lockscreen
      bindl = [
        ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise 5%+"
        ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower 5%-"
        "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%"
        "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 0%"
      ];
      bindle = [
        ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume +2 --max-volume=100"
        ",XF86AudioLowerVolume, exec, swayosd-client --output-volume -2"

        "$mainMod, F3, exec, swayosd-client --output-volume +2 --max-volume=100"
        "$mainMod, F2, exec, swayosd-client --output-volume -2"
      ];
      bindr = [
        "CAPS,Caps_Lock,exec,swayosd-client --caps-lock"
        ",Scroll_Lock,exec,swayosd-client --scroll-lock"
        ",Num_Lock,exec,swayosd-client --num-lock"
      ];
    };
  };

  xdg.configFile."swayosd/style.css".text = ''
    window {
        padding: 0px 10px;
        border-radius: 25px;
        border: 10px;
        background: alpha(#1e1e2e, 0.99);
    }

    #container {
        margin: 15px;
    }

    image, label {
        color: #cdd6f4;
    }

    progressbar:disabled,
    image:disabled {
        opacity: 0.95;
    }

    progressbar {
        min-height: 6px;
        border-radius: 999px;
        background: transparent;
        border: none;
    }
    trough {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: alpha(#a6adc8, 0.2);
    }
    progress {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: #a6adc8;
    }
  '';
}
