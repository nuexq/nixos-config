{ ... }:
{
  programs.waybar.style = ''
    * {
  border: none;
  border-radius: 0px;
  font-family: "JetBrainsMono Nerd Font";
  font-size: 10px;
  min-height: 10px;
}

window#waybar {
  background: transparent;
  font-size: 12px;
}

tooltip {
  background: #181825;
  color: #cdd6f4;
  border-radius: 0px;
  border-width: 0px;
}

#workspaces button {
  box-shadow: none;
  text-shadow: none;
  padding: 0px;
  border-radius: 0px;
  margin-top: 3px;
  margin-bottom: 3px;
  margin-left: 0px;
  padding-left: 3px;
  padding-right: 3px;
  margin-right: 0px;
  color: #cdd6f4;
    animation: ws_normal 20s ease-in-out 1;
}

#workspaces button.active {
  background: #a6adc8;
  color: #1e1e2e;
  margin-left: 3px;
  padding-left: 12px;
  padding-right: 12px;
  margin-right: 3px;
    animation: ws_active 20s ease-in-out 1;
    transition: all 0.4s cubic-bezier(0.55, -0.68, 0.48, 1.682);
}

#taskbar button {
  box-shadow: none;
  text-shadow: none;
  padding: 0px;
  border-radius: 0px;
  margin-top: 3px;
  margin-bottom: 3px;
  margin-left: 0px;
  padding-left: 3px;
  padding-right: 3px;
  margin-right: 0px;
  color: #a6adc8;
    animation: tb_normal 20s ease-in-out 1;
}

#taskbar button.active {
  background: #a6adc8;
  color: #181825;
  margin-left: 3px;
  padding-left: 12px;
  padding-right: 12px;
  margin-right: 3px;
    animation: tb_active 20s ease-in-out 1;
    transition: all 0.4s cubic-bezier(0.55, -0.68, 0.48, 1.682);
}

#backlight,
#battery,
#clock,
#cpu,
#idle_inhibitor,
#memory,
#network,
#custom-notification,
#custom-power,
#pulseaudio,
#taskbar,
#tray,
#window,
#workspaces,
#custom-l_end,
#custom-r_end,
#custom-sl_end,
#custom-sr_end,
#custom-rl_end,
#custom-rr_end,
#custom-tomato,
#custom-dijo {
  color: #cdd6f4;
  background: #181825;
  opacity: 1;
  margin: 4px 0px 4px 0px;
  padding-left: 4px;
  padding-right: 4px;
}

#workspaces,
#taskbar {
  padding: 0px;
}

#custom-r_end {
  border-radius: 0px;
  margin-right: 9px;
  padding-right: 3px;
}

#custom-l_end {
  border-radius: 0px;
  margin-left: 9px;
  padding-left: 3px;
}

#custom-sr_end {
  border-radius: 0px;
  margin-right: 9px;
  padding-right: 3px;
}

#custom-sl_end {
  border-radius: 0px;
  margin-left: 9px;
  padding-left: 3px;
}

#custom-rr_end {
  border-radius: 0px;
  margin-right: 9px;
  padding-right: 3px;
}

#custom-rl_end {
  border-radius: 0px;
  margin-left: 9px;
  padding-left: 3px;
}
  '';
}
