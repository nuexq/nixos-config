{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi-wayland ];

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      font: "JetBrainsMono Nerd Font";

      bg0: #1e1e2e;
      bg1: #313244;
      fg0: #cdd6f4;

      accent-color: #313244;
      urgent-color: #f9e2af;

      background-color: transparent;
      text-color: @fg0;

      margin: 0;
      padding: 0;
      spacing: 0;
    }

    window {
      location: center;
      width: 480;
      background-color: @bg0;
    }

    inputbar {
      spacing: 8px;
      padding: 8px;
      background-color: @bg1;
    }

    prompt, entry, element-icon, element-text {
      vertical-align: 0.5;
    }

    prompt {
      text-color: @accent-color;
    }

    textbox {
      padding: 8px;
      background-color: @bg1;
    }

    listview {
      padding: 4px 0;
      lines: 8;
      columns: 1;
      fixed-height: false;
    }

    element {
      padding: 8px;
      spacing: 8px;
    }

    element normal normal {
      text-color: @fg0;
    }

    element normal urgent {
      text-color: @urgent-color;
    }

    element normal active {
      text-color: @accent-color;
      text-color: @fg0;
    }

    element alternate active {
      text-color: @accent-color;
      text-color: @fg0;
    }

    element selected {
      text-color: @fg0;
    }

    element selected normal, element selected active {
      background-color: @accent-color;
      text-color: @fg0;
    }

    element selected urgent {
      background-color: @urgent-color;
    }

    element-icon {
      size: 0.8em;
    }

    element-text {
      text-color: inherit;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "run,drun,window";
      lines: 8;
      cycle: false;
      font: "JetBrainsMono Nerd Font Medium 12";
      show-icons: true;
      icon-theme: "Papirus-dark";
      terminal: "ghostty";
      drun-display-format: "{icon} {name}";
      location: 0;
      disable-history: true;
      hide-scrollbar: true;
      display-drun: " Apps ";
      sorting-method: "fzf";
    }

    @theme "theme"

    element-text, element-icon, mode-switcher {
      background-color: inherit;
      text-color: inherit;
    }

    mode-switcher {
      spacing: 0;
    }
  '';
}

