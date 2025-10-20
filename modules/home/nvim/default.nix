{ pkgs, ... }: {
  home.packages = with pkgs; [
    tree-sitter
  ];

  programs.neovim = { enable = true; };

  xdg.configFile."nvim".source = ./nvim;
}
