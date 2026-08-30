{
  stdenv,
  fetchFromGitHub,
  installFontsHook,
}:

stdenv.mkDerivation {
  pname = "deserted-font";
  version = "unstable-2022-12-26";

  src = fetchFromGitHub {
    owner = "wooosh";
    repo = "deserted-font";
    rev = "REPLACE_WITH_COMMIT_HASH"; # pin, don't use "master"
    hash = ""; # nix build will tell you the correct sha256
  };

  nativeBuildInputs = [ installFontsHook ];

  installPhase = ''
    runHook preInstall
    installFonts shnm8x16a.bdf
    runHook postInstall
  '';

  meta = {
    description = "Deserted, a bitmap font by wooosh";
    homepage = "https://github.com/wooosh/deserted-font";
    license = null; # no LICENSE file in the repo
  };
}
