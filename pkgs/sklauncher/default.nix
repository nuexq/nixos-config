{ pkgs }:

let
  desktop = pkgs.makeDesktopItem {
    name = "sklauncher";
    desktopName = "SKLauncher";
    exec = "sklauncher";
    icon = "sklauncher";
    type = "Application";
    terminal = false;
    categories = [ "Game" ];
  };
in

pkgs.stdenv.mkDerivation rec {
  pname = "sklauncher";
  version = "3.2.18";

  src = pkgs.fetchurl {
    url = "https://skmedix.pl/binaries/skl/${version}/SKlauncher-${version}.jar";
    hash = "sha256-Jac+N3Ch2NFLzlPokg4uiTqsw8cV0Psi+HjvIJDQOGM=";
  };

  dontUnpack = true;

  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    install -Dm644 $src $out/share/java/${pname}.jar

    makeWrapper ${pkgs.jdk}/bin/java $out/bin/${pname} \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath [
        pkgs.openjfx
        pkgs.gtk3
        pkgs.glib
      ]} \
      --add-flags "-jar $out/share/java/${pname}.jar"

    mkdir -p $out/share/applications
    cp ${desktop}/share/applications/* $out/share/applications/

    install -Dm644 ${./sklauncher.svg} \
      $out/share/icons/hicolor/scalable/apps/sklauncher.svg
  '';

  meta = with pkgs.lib; {
    description = "Secure and modern Minecraft launcher";
    homepage = "https://skmedix.pl";
    license = licenses.unfree;
    platforms = platforms.linux;
    mainProgram = "sklauncher";
  };
}
