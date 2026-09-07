{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;

    vesktop.enable = true;

    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/themes/flavors/midnight-catppuccin-mocha.theme.css"
      ];
      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;
      useQuickCss = true;
      disableMinSize = true;

      plugins = {
        shikiCodeblocks = {
          enable = true;
          theme = "https://cdn.jsdelivr.net/gh/shikijs/textmate-grammars-themes@bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-mocha.json";
        };
        youtubeAdblock.enable = true;
        clearUrls.enable = true;
        onePingPerDm.enable = true;
        gifPaste.enable = true;
        volumeBooster.enable = true;

        textReplace = {
          enable = true;
          regexRules = [
            {
              find = "instagram\\.com";
              replace = "kkinstagram.com";
              onlyIfIncludes = "";
            }
            {
              find = "twitter\\.com";
              replace = "fixupx.com";
              onlyIfIncludes = "";
            }
            {
              find = "x\\.com";
              replace = "fixupx.com";
              onlyIfIncludes = "";
            }
          ];
        };
      };
    };
  };
}
