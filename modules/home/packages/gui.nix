{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    obs-studio
    pavucontrol
    vlc

    ## Utility
    zenity
  ];
}
