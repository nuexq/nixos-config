{ inputs, ... }: {
  imports = [ inputs.vicinae.homeManagerModules.default ];

  services.vicinae = {
    enable = true;
    autoStart = false;
    settings = {
      faviconService = "twenty";
      font.size = 11;
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      theme.name = "catppuccin-mocha";
      window = {
        csd = true;
        opacity = 0.95;
        anchor = ["top"];
        exclusive = false;
        rounding = 0;
      };
    };
    # Installing (vicinae) extensions declaratively
    # extensions = [
    #   (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
    #     inherit pkgs;
    #     name = "extension-name";
    #     src =
    #       pkgs.fetchFromGitHub { # You can also specify different sources other than github
    #         owner = "repo-owner";
    #         repo = "repo-name";
    #         rev =
    #           "v1.0"; # If the extension has no releases use the latest commit hash
    #         # You can get the sha256 by rebuilding once and then copying the output hash from the error message
    #         sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    #       }; # If the extension is in a subdirectory you can add ` + "/subdir"` between the brace and the semicolon here
    #   })
    # ];
  };
}
