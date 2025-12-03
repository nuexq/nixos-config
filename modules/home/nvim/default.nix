{ pkgs, ... }: {
  home.packages = with pkgs; [
    tree-sitter
    python313Packages.pylatexenc
    tectonic
  ];

  programs.neovim = { enable = true; };

  xdg.configFile."nvim".source = ./nvim;
}
