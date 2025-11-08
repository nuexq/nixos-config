{ ... }: {
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = false;
      autoStart = false;
    };
    settings = {
      faviconService = "twenty";
      font = {
        size = 11;
        normal = "Inter Nerd Font";
      };
      closeOnFocusLoss = false;
      popToRootOnClose = true;
      rootSearch.searchFiles = false;
      theme.name = "catppuccin-mocha";
      window = {
        csd = true;
        opacity = 1.0;
        rounding = 0;
      };
    };
  };
}
