{ pkgs, lib }:

let
  ioskeley = pkgs.callPackage ./ioskeley-mono { };
in
{
  sklauncher = pkgs.callPackage ./sklauncher { };

  ioskeley-mono = lib.recurseIntoAttrs ioskeley;
}
