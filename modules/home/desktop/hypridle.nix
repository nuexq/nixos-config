{ ... }: {
  services.hypridle.enable = true;

  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
      lock_cmd = pidof hyprlock || hyprlock
      before_sleep_cmd = loginctl lock-session
      after_sleep_cmd = niri msg action power-on-monitors
    }

    listener {
      timeout = 300
      on-timeout = niri msg action power-off-monitors
      on-resume = niri msg action power-on-monitors
    } 

    listener {
      timeout = 1800
      on-timeout = systemctl suspend
    }
  '';
}
