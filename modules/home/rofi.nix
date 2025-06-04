{ pkgs, ... }: {
  home.packages = with pkgs; [ rofi-wayland ];

  xdg.configFile."rofi/theme.rasi".text = ''
    configuration {
      font: "JetBrainsMono Nerd Font Medium 10";

      drun {
        display-name: "";
      }

      run {
        display-name: "";
      }

      window {
        display-name: "";
      }

      timeout {
        delay: 10;
        action: "kb-cancel";
      }
    }

    * {
      border: 0;
      margin: 0;
      padding: 0;
      spacing: 0;

      bg: #1e1e2e;
      bg-alt: #313244;
      fg: #cdd6f4;
      fg-alt: #a6adc8;

      background-color: @bg;
      text-color: @fg;
    }

    window {
      transparency: "real";
    }

    mainbox {
      children: [inputbar, listview];
    }

    inputbar {
      background-color: @bg-alt;
      children: [prompt, entry];
    }

    entry {
      background-color: inherit;
      padding: 12px 3px;
    }

    prompt {
      background-color: inherit;
      padding: 12px;
    }

    listview {
      lines: 8;
    }

    element {
      children: [element-icon, element-text];
    }

    element-icon {
      padding: 10px 10px;
    }

    element-text {
      padding: 10px 0;
      text-color: @fg-alt;
    }

    element-text selected {
      text-color: @fg;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "run,drun,window";
      lines: 8;
      cycle: false;
      font: "JetBrainsMono Nerd Font Medium 10";
      show-icons: true;
      icon-theme: "Papirus-dark";
      terminal: "ghostty";
      drun-display-format: "{icon} {name}";
      location: 0;
      disable-history: true;
      hide-scrollbar: true;
      display-drun: " Apps ";
      sorting-method: "fzf";
      timeout {
        delay: 10;
        action: "kb-cancel";
      }
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

