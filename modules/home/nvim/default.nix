{ pkgs, ... }: {
  home.packages = with pkgs; [
    tree-sitter
    python313Packages.pylatexenc
    texlive.combined.scheme-basic
    texlivePackages.latexmk
  ];

  programs.neovim = { enable = true; };

  xdg.configFile."nvim".source = ./nvim;
}
