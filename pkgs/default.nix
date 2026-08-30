{ pkgs }:
{
  sklauncher = pkgs.callPackage ./sklauncher { };
  deserted-font = pkgs.callPackage ./deserted-font { };
}
