{ lib, config, ... }:
let
  inherit (lib) nameValuePair;

  appsToAssoc = {
    browser = {
      app = "zen-beta";
      mimeTypes = [
        "text/html"
        "x-scheme-handler/about"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "x-scheme-handler/unknown"
      ];
    };

    code = {
      app = "nvim";
      mimeTypes = [
        "text/plain"
        "text/english"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-rust"
        "text/x-asm"
        "text/x-tex"
        "application/json"
        "application/toml"
        "application/x-shellscript"
      ];
    };

    media = {
      app = "mpv";
      mimeTypes = [
        "video/*"
        "audio/*"
        "video/x-matroska"
        "video/mp4"
      ];
    };

    images = {
      app = "imv-dir";
      mimeTypes = [
        "image/*"
        "image/png"
        "image/jpeg"
      ];
    };

    fileManager = {
      app = "nemo";
      mimeTypes = [ "inode/directory" ];
    };

    pdf = {
      app = "org.pwmt.zathura";
      mimeTypes = [ "application/pdf" ];
    };

    archives = {
      app = "org.gnome.FileRoller";
      mimeTypes = [
        "application/zip"
        "application/rar"
        "application/7z"
        "application/x-tar"
      ];
    };
  };

  associations' = lib.concatMapAttrs (
    _: val: lib.listToAttrs (lib.map (mt: nameValuePair mt "${val.app}.desktop") val.mimeTypes)
  ) appsToAssoc;

  specifics = {
    "x-scheme-handler/spotify" = [ "spotify.desktop" ];
    "x-scheme-handler/discord" = [ "discord.desktop" ];
  };

  associations = associations' // specifics;
in
{
  xdg = {
    enable = true;

    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";

    userDirs = {
      enable = true;
      createDirectories = true;

      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      desktop = "${config.home.homeDirectory}/Desktop";

      videos = "${config.home.homeDirectory}/Videos";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";

      extraConfig = {
        SCREENSHOTS = "${config.xdg.userDirs.pictures}/Screenshots";
        DEV = "${config.home.homeDirectory}/Developer";
      };
    };

    mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };

    configFile."mimeapps.list".force = true;
  };
}
