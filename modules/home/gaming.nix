{ pkgs, ... }: {
  home.packages = with pkgs; [
    gamemode
    mangohud
    umu-launcher

    nur.repos.${"0komo"}.sklauncher
  ];
}
