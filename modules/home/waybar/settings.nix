{ host, ... }:
 
{
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 28;
    passthrough = false;
    gtk-layer-shell = true;

    modules-left = [
      "custom/padd"
      "custom/l_end"
      "cpu"
      "memory"
      "custom/r_end"
      "custom/l_end"
      "idle_inhibitor"
      "clock"
      "custom/r_end"
      "custom/l_end"
      "hyprland/workspaces"
      "custom/r_end"
      "custom/padd"  
    ];
    modules-center = [ 
      "custom/padd"
      "custom/l_end"
      "hyprland/window"
      "custom/r_end"
      "custom/padd" 
    ];
    modules-right = [
      "custom/padd"
      "custom/l_end"
      "backlight"
      "network"
      "pulseaudio"
      "pulseaudio#microphone",
      "custom/notification"
      "custom/r_end"
      "custom/l_end"
      "tray"
      "battery"
      "custom/r_end"
      "custom/l_end"
      "custom/power"
      "custom/r_end"
      "custom/padd"
    ];

   cpu = {
    interval = 10;
    format = "󰍛 {usage}%";
    rotate = 0;
    format-alt = "{icon0}{icon1}{icon2}{icon3}";
    format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
  };

  memory = {
    states = {
      c = 90; # critical
      h = 60; # high
      m = 30; # medium
    };
    interval = 30;
    format = "󰾆 {used}GB";
    rotate = 0;
    format-m = "󰾅 {used}GB";
    format-h = "󰓅 {used}GB";
    format-c = " {used}GB";
    format-alt = "󰾆 {percentage}%";
    ma-length = 10;
    tooltip = true;
    tooltip-format = "󰾆 {percentage}%\n {used:0.1f}GB/{total:0.1}GB";
  };

  idle_inhibitor = {
    format = "{icon}";
    rotate = 0;
    format-icons = {
      activated = "󰥔";
      deactivated = "";
    };
  };

  clock = {
    format = "{:%I:%M %p}";
    rotate = 0;
    format-alt = "{:%R 󰃭 %d·%m·%y}";
    tooltip-format = "<tt>{calendar}</tt>";
    calendar = {
      mode = "month";
      mode-mon-col = 3;
      on-scroll = 1;
      on-click-right = "mode";
      format = {
        months = "<span color='#ffead3'><b>{}</b></span>";
        weekdays = "<span color='#ffcc66'><b>{}</b></span>";
        today = "<span color='#ff6699'><b>{}</b></span>";
      };
    };
    actions = {
      on-click-right = "mode";
      on-click-forward = "tz_up";
      on-click-backward = "tz_down";
      on-scroll-up = "shift_up";
      on-scroll-down = "shift_down";
    };
  };

  "hyprland/workspaces" = {
    disable-scroll = true;
    rotate = 0;
    all-outputs = true;
    active-only = false;
    on-click = "activate";
    persistent-workspaces = {};
  };

  "hyprland/window" = {
    format = "  {}";
     rotate = 0;
    separate-outputs = true;
    rewrite = {
      "nuexq@NoPc:(.*)" = "$1 ";
      "(.*) — Mozilla Firefox" = "$1 󰈹";
      "(.*)Mozilla Firefox" = "Firefox 󰈹";
      "(.*) - Visual Studio Code" = "$1 󰨞";
      "(.*)Visual Studio Code" = "Code 󰨞";
      "(.*) — Dolphin" = "$1 󰉋";
      "(.*)Spotify" = "Spotify 󰓇";
      "(.*)Steam" = "Steam 󰓓";
    };
    max-length = 1000;
  };

  backlight = {
    device = "intel_backlight";
    rotate = 0;
    format = "{icon} {percent}%";
    format-icons = ["" "" "" "" "" "" "" "" ""];
    on-scroll-up = "swayosd-client --brightness raise 1%+";
    on-scroll-down = "swayosd-client --brightness lower 1%-";
    min-length = 6;
  };

   network = {
    tooltip = true;
    format-wifi = " ";
    rotate = 0;
    format-ethernet = "󰈀 ";
    tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
    format-linked = "󰈀 {ifname} (No IP)";
    format-disconnected = "󰖪 ";
    tooltip-format-disconnected = "Disconnected";
    format-alt = "<span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
    interval = 2;
  };

  pulseaudio = {
    format = "{icon} {volume}";
    rotate = 0;
    format-muted = "婢";
    on-click = "pavucontrol -t 3";
    on-scroll-up = "swayosd-client --output-volume +2 --max-volume=100";
    on-scroll-down = "swayosd-client --output-volume -2";
    tooltip-format = "{icon} {desc} // {volume}%";
    scroll-step = 5;
    format-icons = {
      headphone = "";
      hands-free = "";
      headset = "";
      phone = "";
      portable = "";
      car = "";
      default = ["" "" ""];
    };
  };

  "pulseaudio#microphone" = {
    format = "{format_source}";
    rotate = 0;
    formatsource = "";
    format-sourcemuted = "";
    on-click = "pavucontrol -t 4";
    on-scroll-up = "swayosd-client --input-volume +2 --max-volume=100";
    on-scroll-down = "swayosd-client --input-volume -2";
    tooltip-format = "{format_source} {source_desc}";
    scroll-step = 5;
  },

  "custom/notification" = {
     tooltip = false;
     format = "{icon}";
     format-icons = {
       notification = "<span foreground='#f38ba8'><small><sup>⬤</sup></small></span>";
       none = " ";
       dnd-notification = "<span foreground='#f38ba8'><small><sup>⬤</sup></small></span>";
       dn-none = " ";
       inhibited-notification = "<span foreground='#f38ba8'><sup></sup></span>  <span foreground='#f38ba8'></span>";
       inhibited-none = "  <span foreground='#f38ba8'></span>";
       dnd-inhibited-notification = "<span foreground='#f38ba8'><sup></sup></span>  <span foreground='#f38ba8'></span>";
       dnd-inhibited-none = "  <span foreground='#f38ba8'></span>";
     };
     return-type = "json";
     exec-if = "which swaync-client";
     exec = "swaync-client -swb";
     on-click = "swaync-client -t -sw";
     on-click-right = "swaync-client -d -sw";
     escape = true;
   }; 

  tray = {
    icon-size = 16;
    rotate = 0;
    spacing = 5;
  };

  battery = {
    states = {
      good = 95;
      warning = 30;
      critical = 20;
    };
    format = "{icon} {capacity}%";
    rotate = 0;
    format-charging = " {capacity}%";
    format-plugged = " {capacity}%";
    format-alt = "{time} {icon}";
    format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
  };

  "custom/power" = {
    format = "{}";
    rotate = 0;
    exec = "echo ; echo  logout";
    on-click = "power-menu";
    interval = 86400; # once every da;
    tooltip = true;
  };

  # modules for padding

  "custom/l_end" = {
    format = " ";
    interval = "once";
    tooltip = false;
  };

  "custom/r_end" = {
    format = " ";
    interval = "once";
    tooltip = false;
  };

  "custom/sl_end" = {
    format = " ";
    interval = "once";
    tooltip = false;
  };

  "custom/sr_end" = {
    format = " ";
    interval = "once";
    tooltip = false;
  };

  "custom/rl_end" = {
    format = " ";
    interval = "once";
    tooltip = false;
  };

  "custom/rr_end" = {
    format = " ";
    interval = "once";
    tooltip = false;
  };

  "custom/padd" = {
    format = "  ";
    interval = "once";
    tooltip = false;
  };
    
  };
}
