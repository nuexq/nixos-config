{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "deserted-font";
  version = "unstable-2026-08-03";

  src = fetchFromGitHub {
    owner = "falliah";
    repo = "notepad-dots";
    rev = "3e6bc134bf57f0887e0ddaf2e5f5f7aad3cc8b54";
    hash = "sha256-UtWoC4LsJ/RD/pyDoV1hWPSZ+9/ScxQptcGwyhGXxqQ=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 desertedttf3.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = {
    description = "TTF conversion of the Deserted bitmap font, by falliah";
    homepage = "https://github.com/falliah/notepad-dots";
    license = null;
  };
}
