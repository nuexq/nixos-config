{ pkgs, self, ... }:

{
  home.packages = with pkgs; [
    mangohud
    osu-lazer-bin
    self.packages.${pkgs.stdenv.hostPlatform.system}.sklauncher
  ];
}
