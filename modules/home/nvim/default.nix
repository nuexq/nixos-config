{ pkgs, ... }: {
  home.packages = with pkgs; [
    tree-sitter
    python313Packages.pylatexenc

    (texlive.withPackages (ps:
      with ps; [
        scheme-medium
        enumitem
        titlesec
        tcolorbox
        tikzfill
        pdfcol
        lipsum
      ]))
  ];

  programs.neovim.enable = true;
  xdg.configFile."nvim".source = ./nvim;
}
