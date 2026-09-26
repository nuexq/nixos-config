{
  lib,
  pkgs ? import <nixpkgs> { },
}:
let
  version = "0.14.0";
in

pkgs.rustPlatform.buildRustPackage rec {
  pname = "zapfast";
  inherit version;

  src = pkgs.fetchFromGitHub {
    owner = "crmne";
    repo = "zapfast";
    tag = "v${version}";
    sha256 = "sha256-8yGUUqedr5JnCIdLMhrT0o6hhBL0J1TNUBa/dUIoNB0=";
  };

  cargoHash = "sha256-q4WcvwsqJ13DRW4CVEB/l8/KnBlmjVMXyIrssFRDGsI=";

  doCheck = false;

  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.cmake
  ];

  buildInputs = [
    pkgs.openssl.dev
    pkgs.alsa-lib
    pkgs.alsa-plugins
    pkgs.stdenv.cc.cc.lib
    pkgs.wayland
    pkgs.libxkbcommon
    pkgs.libGL
    pkgs.xorg.libX11
    pkgs.xorg.libXcursor
    pkgs.xorg.libXi
    pkgs.xorg.libXrandr
  ];

  OPENSSL_NO_VENDOR = 1;

  postInstall = ''
    install -Dm444 packaging/applications/zapfast.desktop -t $out/share/applications
    install -Dm444 packaging/icons/zapfast.svg $out/share/icons/hicolor/scalable/apps/zapfast.svg
  '';

  postFixup = ''
    patchelf $out/bin/zapfast \
      --add-rpath ${lib.makeLibraryPath [
        pkgs.wayland
        pkgs.libxkbcommon
        pkgs.libGL
        pkgs.xorg.libX11
        pkgs.xorg.libXcursor
        pkgs.xorg.libXi
        pkgs.xorg.libXrandr
        pkgs.alsa-lib
        pkgs.alsa-plugins
      ]}
  '';

  meta = with lib; {
    description = "ZapFast: a fast, native WhatsApp client in Rust and egui";
    homepage = "https://zapfast.rocks/";
    license = licenses.mit;
    mainProgram = "zapfast";
    platforms = platforms.linux;
  };
}
