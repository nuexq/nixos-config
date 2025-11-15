{ pkgs, config, ... }:

let
  # Override Discord package with Moonlight & Vencord
  discordPkg = pkgs.discord.override {
    withMoonlight = true;
  };

  # JSON generator for settings
  settingsFormat = pkgs.formats.json { };
in
{
  home.packages = [
    discordPkg
  ];

  # Discord general settings
  xdg.configFile."discord/settings.json".source = settingsFormat.generate "discord-settings.json" {
    SKIP_HOST_UPDATE = true;
    DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOUR_DOING = true;
    MIN_WIDTH = 940;
    MIN_HEIGHT = 500;
    openasar = {
      setup = true;
      quickstart = true;
    };
    chromiumSwitches = { };
    IS_MAXIMIZED = true;
    IS_MINIMIZED = false;
    trayBalloonShown = true;
  };

  # Moonlight settings
  xdg.configFile."moonlight-mod/stable.json" = {
    source = settingsFormat.generate "moonlight-settings.json" {
      extensions = {
        betterCodeblocks = true;
        betterEmbedsYT = true;
        clearUrls = true;
        cloneExpressions = true;
        copyWebp = true;
        css = {
          enabled = true;
          config = {
            paths = [
              "https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/themes/flavors/midnight-catppuccin-mocha.theme.css"
            ];
          };
        };
        disableSentry = true;
        domOptimizer = true;
        experiments = true;
        favouriteGifSearch = true;
        freeMoji = true;
        freeScreenShare = true;
        greentext = false;
        httpCats = true;
        inviteToNowhere = true;
        lastFmRpc = false;
        memberCount = true;
        moonbase = true;
        nativeFixes = {
          enabled = true;
          config.vaapiIgnoreDriverChecks = true;
        };
        noHideToken = true;
        noReplyChainNag = true;
        noTrack = true;
        onePingPerDM = true;
        pronouns = true;
        textReplacer = {
          enabled = true;
          config = {
            patterns = {
              "://instagram.com/" = "://ddinstagram.com/";
              "://reddit.com/" = "://rxddit.com/";
              "://tiktok.com/" = "://tfxktok.com/";
              "://twitter.com/" = "://vxtwitter.com/";
              "://vm.tiktok.com/" = "://vm.vxtiktok.com/";
              "://www.instagram.com/" = "://ddinstagram.com/";
              "://www.reddit.com/" = "://rxddit.com/";
              "://x.com/" = "://vxtwitter.com/";
            };
          };
        };
        volumeManipulator = true;
      };
      repositories = [ "https://moonlight-mod.github.io/extensions-dist/repo.json" ];
    };
  };
}
