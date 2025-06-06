{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    obs-studio
    pavucontrol
    vlc

    qalculate-gtk

    ## Utility
    zenity
  ];
}
