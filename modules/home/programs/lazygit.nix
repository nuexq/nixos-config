{ pkgs, ... }:
{

  programs.lazygit = {
    enable = true;

    settings = {
      gui.border = "single";
      git = {
        pagers = [
          {
            command = "difft --color=always";
            externalDiffCommand = "difft";
          }
        ];
      };
    };
  };
}
