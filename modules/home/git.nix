{ pkgs, username, ... }:
{
  programs.git = {
    enable = true;

    userName = "nuexq";
    userEmail = "nuexqq@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
      url = {
        "git@github.com:".insteadOf = [
          "gh:"
          "https://github.com/"
        ];
        "git@github.com:nuexq/".insteadOf = "fp:";
      };
      core.excludesFile = "/home/${username}/.config/git/.gitignore";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = false;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };

  home.packages = [ pkgs.gh ]; # pkgs.git-lfs
}
