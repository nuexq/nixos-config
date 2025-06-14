{ pkgs, ... }: {
  home.packages = with pkgs; [
    gamemode                         # gamemoderun
    mangohud                         # monitoring fps
    umu-launcher                     # proton outside steam
    nur.repos.${"0komo"}.sklauncher  # sklauncher
  ];
}
