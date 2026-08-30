{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "deserted-font";
  version = "unstable-2022-12-26";

  src = fetchFromGitHub {
    owner = "wooosh";
    repo = "deserted-font";
    rev = "c356064b7b6973d34a2518d5ff364e58e19e7be1";
    hash = "sha256-mTgIZetgbKiXu287pxbyfKP4+fiuOD8HP7tM/uK+Cug=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 shnm8x16a.bdf -t $out/share/fonts/misc
    runHook postInstall
  '';

  meta = {
    description = "Deserted, a bitmap font by wooosh";
    homepage = "https://github.com/wooosh/deserted-font";
    license = null;
  };
}
