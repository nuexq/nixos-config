{ pkgs, ... }:
{
  home.packages = with pkgs; [ swayosd ];

  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [ "swayosd-server" ];

      bind = [ ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle" ];
      # binds active in lockscreen
      bindl = [
        "ALT, F5, exec, swayosd-client --brightness raise 5%+"
        "ALT, F6, exec, swayosd-client --brightness lower 5%-"
      ];
      bindle = [
        ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume +2 --max-volume=100"
        ",XF86AudioLowerVolume, exec, swayosd-client --output-volume -2"

	# volume
        "ALT, F1, exec, swayosd-client --output-volume mute-toggle"
        "ALT, F3, exec, swayosd-client --output-volume +2 --max-volume=100"
        "ALT, F2, exec, swayosd-client --output-volume -2"

	# mic
        "ALT, F4, exec, swayosd-client --input-volume mute-toggle"
      ];
      bindr = [
        "CAPS,Caps_Lock,exec,swayosd-client --caps-lock"
        ",Scroll_Lock,exec,swayosd-client --scroll-lock"
        ",Num_Lock,exec,swayosd-client --num-lock"
      ];
    };
  };
}
