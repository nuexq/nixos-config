{
  pkgs,
  ...
}:
{
  programs.hypridle = {
    enable = true;
    settings = {

    general = {
      lock_cmd = "hyprlock";
      before_sleep_cmd = "hyprlock";
      after_sleep_cmd = "hyprctl dispatch dpms on"
    };

    listeners = [
      {
        timeout = 600;
        on-timeout = "hyprlock";
        on-resume = "";
      }
      {
        timeout = 1800;
        on-timeout = "systemctl suspend";
        on-resume = "";
      }
    ];
  }
}
