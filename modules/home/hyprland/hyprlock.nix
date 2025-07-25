{ inputs, pkgs, config, ... }: {
  programs.hyprlock = {
    enable = true;

    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

    settings = {
      general = {
        hide_cursor = true;
        grace = 0;
      };

      background = [{
        monitor = "";
        path = "${config.home.homeDirectory}/Pictures/current-wallpaper";
        blur_passes = 3;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      }];

      label = [
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';
          color = "rgba(205, 214, 244, 0.9)";
          font_size = 120;
          font_family = "Maple Mono NF CN Bold";
          position = "0, -100";
          halign = "center";
          valign = "top";
        }
        # Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo "- $(date +'%A, %B %d') -" '';
          color = "rgba(205, 214, 244, 0.9)";
          font_size = 18;
          font_family = "Maple Mono NF CN";
          position = "0, -300";
          halign = "center";
          valign = "top";
        }
        # Username
        {
          monitor = "";
          text = "Welcome $USER";
          color = "rgba(205, 214, 244, 1)";
          font_size = 16;
          font_family = "Maple Mono NF CN Bold";
          position = "0, 40";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [{
        monitor = "";
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgba(205, 214, 244, 0.9)";
        font_family = "Maple Mono NF CN Bold";
        fade_on_empty = false;
        placeholder_text =
          ''<i><span foreground="##cdd6f4">Enter Password</span></i>'';
        hide_input = false;
        position = "0, -40";
        halign = "center";
        valign = "center";
      }];
    };
  };
}
