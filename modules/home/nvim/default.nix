{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tree-sitter
    qt6.qtdeclarative # QML LSP
    python313Packages.pylatexenc

    (texlive.withPackages (
      ps: with ps; [
        scheme-medium
        enumitem
        titlesec
        tcolorbox
        tikzfill
        pdfcol
        lipsum
        fontspec
        arabluatex
        amiri
      ]
    ))
  ];

  programs.neovim.enable = true;
  xdg.configFile."nvim".source = ./nvim;
}
