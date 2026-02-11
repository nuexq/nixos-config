{ inputs, pkgs, ... }: {
  imports = [ inputs.vicinae.homeManagerModules.default ];

  services.vicinae = {
    enable = true;
    settings = {
      faviconService = "twenty";
      font.normal = {
        size = 11;
        normal = "Inter Nerd Font";
      };
      theme.dark.name = "catppuccin-mocha";
      rootSearch.searchFiles = false;
      closeOnFocusLoss = false;
      launcher_window = {
        opacity = 1.0;
        client_side_decorations.rounding = 0;
        layer_shell.enabled = false;
      };
      providers = {
        "@sovereign/vicinae-extension-awww-switcher-0" = {
          preferences = {
            wallpaperPath = "/home/nuexq/Pictures/wallpapers";
            postCommand = "ln -sf \${wallpaper} ~/Pictures/current-wallpaper";
          };
        };
      };
    };
    extensions =
      with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
        nix
        awww-switcher
      ];
  };
}
