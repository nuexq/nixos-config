{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    inputs.sonora.packages.${system}.default
  ];
}
