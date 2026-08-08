{ config, ... }:
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let

      hyper = "Mod+Shift+Alt+Ctrl";
    in
    {
      # Mod + <letter> -> Look at or open...
      # Mod + Shift + <letter> -> Move or shift this...
      # Mod + Alt + <letter> -> Modify or toggle layout...
      # Hyper + <letter> -> Systems overlay / Utilities action...

      ## Core Applications & Launchers
      "Mod+Return".action = spawn "ghostty";
      "Mod+B".action = spawn "helium";
      "Mod+E".action = spawn "nemo";

      ## Vim Focus Navigation
      "Mod+H".action = focus-column-left;
      "Mod+L".action = focus-column-right;
      "Mod+J".action = focus-window-down;
      "Mod+K".action = focus-window-up;

      ## Focus & Layout State
      "Mod+Q".action = close-window;
      "Mod+F".action = maximize-column;
      "Mod+W".action = toggle-column-tabbed-display; # Stack column windows vertically into tabs
      "Mod+C".action = center-column; # Re-center active column on ribbon
      "Mod+R".action = switch-preset-column-width; # Cycle column widths (e.g. 50% -> 66% -> 100%)
      "Mod+O".action = toggle-overview;

      ## Workspace Focus
      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;

      ## Positional Column/Window Movement
      "Mod+Shift+H".action = move-column-left;
      "Mod+Shift+L".action = move-column-right;
      "Mod+Shift+J".action = move-window-down;
      "Mod+Shift+K".action = move-window-up;

      ## Send Column to Workspace (Follow Focus)
      "Mod+Shift+1".action = {
        move-column-to-workspace = 1;
      };
      "Mod+Shift+2".action = {
        move-column-to-workspace = 2;
      };
      "Mod+Shift+3".action = {
        move-column-to-workspace = 3;
      };
      "Mod+Shift+4".action = {
        move-column-to-workspace = 4;
      };
      "Mod+Shift+5".action = {
        move-column-to-workspace = 5;
      };

      ## Fullscreen & Session
      "Alt+Return".action = fullscreen-window;
      "Mod+Shift+Q".action = quit;
      # "Mod+Shift+Slash".action = show-hotkey-overlay;

      ## Column Consumption & Expulsion (Unique to Niri)
      "Mod+Alt+H".action = consume-window-into-column; # Pull left window into vertical stack
      "Mod+Alt+L".action = expel-window-from-column; # Push top/active window out into new column

      "Mod+BracketLeft".action = consume-or-expel-window-left;
      "Mod+BracketRight".action = consume-or-expel-window-right;

      ## Window State & Height Controls
      "Mod+V".action = toggle-window-floating;
      "Mod+Alt+R".action = reset-window-height;
      "Mod+Alt+Minus".action = set-column-width "-10%";
      "Mod+Alt+Equal".action = set-column-width "+10%";

      ## Compositor & Input Toggles
      # "Mod+Alt+A".action = toggle-animations;
      "Mod+Alt+Escape".action = toggle-keyboard-shortcuts-inhibit; # Pass all keys straight to VM / Game

      ## System Overlays
      "Alt+Space".action = spawn "vicinae" "toggle"; # Classic launcher mapping
      "${hyper}+V".action = spawn "vicinae" "vicinae://launch/clipboard/history";
      "${hyper}+C".action = spawn "hyprpicker" "-a";
      "${hyper}+Equal".action = spawn "woomer";
      "Mod+Escape".action = spawn "hyprlock";
      "${hyper}+B".action = spawn "toggle-waybar";

      ## Screen Capture
      "${hyper}+S".action.screenshot = {
        show-pointer = false;
      };
      "${hyper}+A".action.screenshot-window = {
        write-to-disk = false;
        show-pointer = false;
      };
      "${hyper}+F".action.screenshot-screen = {
        show-pointer = false;
      };

      ## Media Keys
      "XF86AudioRaiseVolume".action = spawn "swayosd-client" "--output-volume" "raise";
      "XF86AudioLowerVolume".action = spawn "swayosd-client" "--output-volume" "lower";
      "XF86AudioMute".action = spawn "swayosd-client" "--output-volume" "mute-toggle";
      "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      "XF86MonBrightnessUp".action = spawn "swayosd-client" "--brightness" "raise";
      "XF86MonBrightnessDown".action = spawn "swayosd-client" "--brightness" "lower";

      "Caps_Lock".action = spawn "swayosd-client" "--caps-lock";
      "Num_Lock".action = spawn "swayosd-client" "--num-lock";
    };
}
