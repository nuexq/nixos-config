{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gamemode
    mangohud

    ## Minecraft
    # prismlauncher
  ];
}
