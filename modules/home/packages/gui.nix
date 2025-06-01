{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    gimp
    obs-studio
    pavucontrol
    pitivi # video editing
    vlc

    ## Office
    libreoffice
    gnome-calculator

    ## Utility
    dconf-editor
    gnome-disk-utility
    mission-center # GUI resources monitor
    zenity

    ## Level editor
    ldtk
    tiled
  ];
}
