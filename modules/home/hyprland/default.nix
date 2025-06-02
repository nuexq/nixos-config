{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./config.nix
    ./hyprlock.nix
    ./variables.nix
    ./hypridle.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
