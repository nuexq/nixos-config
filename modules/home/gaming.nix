{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gamemode
    mangohud
    umu-launcher

    ## Minecraft
    # prismlauncher
  ];
}
