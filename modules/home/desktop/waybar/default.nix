{ ... }:
{
  imports = [
    ./settings.nix
    ./style.nix
  ];
  programs.waybar = {
    enable = true;
  };
}
