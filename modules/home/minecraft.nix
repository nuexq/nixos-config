{ pkgs, lib, ... }:

{
  home.packages = [
    (pkgs.stdenv.mkDerivation rec {
      pname = "nminecraft";
      version = "3.2.12";

      src = pkgs.fetchurl {
        url = "https://skmedix.pl/binaries/skl/${version}/SKlauncher-${version}.jar";
        sha256 = "a3912e1e9b4e3b2d5362c91176444c7d5b1a15437cb827f123e4ca2b0d12c3f9";
      };

      nativeBuildInputs = [ pkgs.copyDesktopItems ];

      phases = [
        "installPhase"
        "copyDesktopItems"
      ];

      jvmOptions = [
        "-Xms2G"
        "-Xmx16G"
      ];

      installPhase = ''
        mkdir -p "$out/bin"
        mkdir -p "$out/share/sklauncher"
        cp "$src" "$out/share/sklauncher/SKlauncher.jar"

        cat > "$out/bin/nminecraft" <<EOF
        #!/bin/sh
        DEFAULT_JVM_OPTS="${toString jvmOptions}"
        exec \
        ${lib.getExe pkgs.steam-run} \
        ${lib.getExe' pkgs.openjdk21 "java"} \
        \$DEFAULT_JVM_OPTS \
        "\$@" \
        -jar $out/share/sklauncher/SKlauncher.jar
        EOF

        chmod +x "$out/bin/nminecraft"
      '';

      desktopItems = [
        (pkgs.makeDesktopItem {
          name = "SkLauncher";
          exec = "nminecraft";
          icon = "minecraft-launher";
          desktopName = "SKLauncher";
          genericName = "A Minecraft Launcher";
          categories = [ "Game" ];
        })
      ];

      meta = with lib; {
        description = "Minecraft launcher using SKLauncher";
        homepage = "https://skmedix.pl/";
        license = licenses.unfree;
        mainProgram = "nminecraft";
      };
    })
  ];
}

