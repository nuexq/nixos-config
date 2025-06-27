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
      sha256 = "0awarrfgzg4wang7m7v79qq59y545mrjh1cc14rn1r49krzg5ibp";
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
        };
      };
    };

    libinput.enable = true;
  };

  # Avoid long shutdown times
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}

