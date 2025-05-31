{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "catppuccin-mocha";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batgrep
      # batdiff
    ];
  };
}
