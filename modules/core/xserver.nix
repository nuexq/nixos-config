{ pkgs, ... }:

let
  minesddm = pkgs.stdenv.mkDerivation rec {
    pname = "minesddm";
    version = "1.0";

    dontBuild = true;

    src = pkgs.fetchFromGitHub {
      owner = "Davi-S";
      repo = "sddm-theme-minesddm";
      rev = "65de0d6f32d3bcbe23ebddb2aff89220dc56bcb2";
      sha256 = "sha256-oV6/zsyAHCV8U3jYqQFxwk/JYrxq9T7ekg6GaJT+dXc=";
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
    };
    displayManager = {
      autoLogin.enable = false;
      sddm = {
        enable = true;
        theme = "minesddm";
        package = pkgs.kdePackages.sddm;
      };
    };

    libinput.enable = true;
  };
}
