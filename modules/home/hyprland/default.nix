{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./variables.nix
    ./hypridle.nix
    inputs.hyprland.homeManagerModules.default
  ];

  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
}
