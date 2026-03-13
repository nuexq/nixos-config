{ pkgs, username, ... }: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "nuexq";
        email = "nuexqq@gmail.com";

      };
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      pull.ff = "only";
      color.ui = true;
      core.excludesFile = "/home/${username}/.config/git/.gitignore";
      diff = {
        external = "${pkgs.difftastic}/bin/difft";
        colorMoved = "default";
      };
      difftool = {
        difftastic = {
          cmd = ''${pkgs.difftastic}/bin/difft "$LOCAL" "$REMOTE"'';
        };
      };
    };
  };

  home.packages = with pkgs; [ gh difftastic ];
}
