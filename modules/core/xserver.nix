{ username, pkgs, ... }:

let
  minesddm = pkgs.stdenv.mkDerivation rec {
    pname = "minesddm";
    version = "1.0";

    dontBuild = true;

    src = pkgs.fetchFromGitHub {
      owner = "Davi-S";
      repo = "sddm-theme-minesddm";
      rev = "main";
      sha256 = "1n0frzm66hy3hiz029xnxji3qb4w5x7ali7k6n71nfgbwwjmcin9";
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src/minesddm $out/share/sddm/themes/minesddm
    '';
  };
in
{
  environment.systemPackages = with pkgs; [
    minesddm
  ];

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

