{ ... }: {
  services.hypridle.enable = true;

  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
      lock_cmd = hyprlock
      before_sleep_cmd = loginctl lock-session
      after_sleep_cmd = hyprctl dispatch dpms on
    }

    listener {
      timeout = 600
      on-timeout = loginctl lock-session
    }

    listener {
      timeout = 1800
      on-timeout = systemctl suspend
    }
  '';
}

