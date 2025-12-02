{ pkgs, ... }: {
  home.packages = with pkgs; [ tree-sitter python313Packages.pylatexenc ];

  programs.neovim = { enable = true; };

  xdg.configFile."nvim".source = ./nvim;
}
