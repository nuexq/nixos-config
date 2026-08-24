{ ... }:
{
  programs.lazygit = {
    enable = true;

    settings = {
      gui.border = "single";
      git = {
        diffRenderers = [
          {
            command = "difft --color=always";
            type = "extDiff";
          }
        ];
      };
    };
  };
}
