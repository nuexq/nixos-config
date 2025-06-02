{
  inputs,
  pkgs,
  host,
  ...
}:
{
  programs.hyprlock = {
    enable = true;

    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

    settings = {
      general = {
        hide_cursor = true;
	no_fade_in = false;
        grace = 0;
    	disable_loading_bar = true;
      };

      background = [
        {
          monitor = "";
          path = "${../../../wallpapers/otherWallpaper/catppuccin/clouds.jpg}";
          blur_passes = 3;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      shape = [
        # User box
        {
          monitor = "";
          size = "300, 50";
          color = "rgba(88, 91, 112, 0.33)";
          rounding = 10;
          border_color = "rgba(205, 214, 244, 0)";
          position = "0, 120";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';
          color = "rgba(205, 214, 244, 0.9)";
          font_size = 115;
          font_family = "Maple Mono NF Bold";
          shadow_passes = 3;
          position = "0, -25";
          halign = "center";
          valign = "top";
        }
        # Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo "- $(date +'%A, %B %d') -" '';
          color = "rgba(205, 214, 244, 0.9)";
          font_size = 18;
          font_family = "Maple Mono NF";
          shadow_passes = 3;
          position = "0, -225";
          halign = "center";
          valign = "top";
        }
        # Username
        {
          monitor = "";
          text = "  $USER";
          color = "rgba(205, 214, 244, 1)";
          font_size = 15;
          font_family = "Maple Mono NF Bold";
          position = "0, 131";
          halign = "center";
          valign = "bottom";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.5)";
          color = "rgba(205, 214, 244, 0.9)";
          font_color = "rgba(205, 214, 244, 0.9)";
          font_size = 14;
          font_family = "Maple Mono NF Bold";
          fade_on_empty = false;
          placeholder_text = ''<i><span foreground="##cdd6f4">Enter Password</span></i>'';
          hide_input = false;
          position = "0, 50";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
