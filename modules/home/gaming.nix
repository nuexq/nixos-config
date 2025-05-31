{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    gamemode

    ## Minecraft
    # prismlauncher
  ];
}
