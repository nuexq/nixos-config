{ pkgs, ... }:
{
  programs.quickshell = {
    enable = true;

    package = pkgs.symlinkJoin {
      name = "quickshell-wrapped";
      paths = [
        pkgs.quickshell
        pkgs.kdePackages.qtimageformats
      ];
      meta.mainProgram = pkgs.quickshell.meta.mainProgram;
    };

    systemd.enable = true;
  };

  # cli tools that used in the components
  home.packages = with pkgs; [
    brightnessctl
    inotify-tools
  ];
}
