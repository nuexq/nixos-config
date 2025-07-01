{ pkgs, ... }:

let
  minesddm = pkgs.stdenv.mkDerivation rec {
    pname = "minesddm";
    version = "1.0";

    dontBuild = true;

    src = pkgs.fetchFromGitHub {
      owner = "Davi-S";
      repo = "sddm-theme-minesddm";
      rev = "main";
      sha256 = "sha256-d8Xyfp6J5GAzCYwFKHMtpPhUME5nn3qeVZy8/1zOiis=";
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src/minesddm $out/share/sddm/themes/minesddm
    '';
  };
in {
  environment.systemPackages = [ minesddm ];

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ara";

      displayManager = {
        autoLogin.enable = false;
        sddm = {
          enable = true;
          theme = "minesddm";
          package = pkgs.libsForQt5.sddm;
        };
      };
    };

    libinput.enable = true;
  };

  # Avoid long shutdown times
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}

