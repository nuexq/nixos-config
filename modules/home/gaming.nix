{ pkgs, self, ... }:

{
  home.packages = with pkgs; [
    mangohud
    umu-launcher
    shipwright
    osu-lazer-bin
    self.packages.${pkgs.system}.sklauncher
  ];
}
