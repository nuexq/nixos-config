{ ... }: {

  programs.vesktop = {
    enable = true;
    vencord.settings = {
      themeLinks = [''
        https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/themes/flavors/midnight-catppuccin-mocha.theme.css
      ''];
      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;
      useQuickCss = true;
      disableMinSize = true;
      plugins = {
        ShikiCodeblocks = {
          enabled = true;
          theme =
            "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/2d87559c7601a928b9f7e0f0dda243d2fb6d4499/packages/tm-themes/themes/catppuccin-mocha.json";
        };
        YoutubeAdblock.enabled = true;
        FixYoutubeEmbeds.enabled = true;
        ClearUrls.enabled = true;
        ExpressionCloner.enabled = true;
        MemberCount.enabled = true;
        SpotifyCrack.enabled = true;
        OnePingPerDM.enabled = true;
        TextReplace = {
          enabled = true;
          regexRules = [
            {
              find = "instagram\\.com";
              replace = "ddinstagram.com";
              onlyIfIncludes = "";
            }
            {
              find = "reddit\\.com";
              replace = "rxddit.com";
              onlyIfIncludes = "";
            }
            {
              find = "tiktok\\.com";
              replace = "tfxktok.com";
              onlyIfIncludes = "";
            }
            {
              find = "twitter\\.com";
              replace = "vxtwitter.com";
              onlyIfIncludes = "";
            }
            {
              find = "vm\\.tiktok\\.com";
              replace = "vm.vxtiktok.com";
              onlyIfIncludes = "";
            }
            {
              find = "www\\.instagram\\.com";
              replace = "ddinstagram.com";
              onlyIfIncludes = "";
            }
            {
              find = "www\\.reddit\\.com";
              replace = "rxddit.com";
              onlyIfIncludes = "";
            }
            {
              find = "x\\.com";
              replace = "vxtwitter.com";
              onlyIfIncludes = "";
            }
          ];

        };
        VolumeBooster.enabled = true;
      };
    };
  };
}
