{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.serein.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
