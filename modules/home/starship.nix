{ pkgs, ... }: {
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      add_newline = true;
      character = {
        disabled = false;
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
      };

      directory = {
        style = "blue";
        format = "[$path ]($style)";
        truncation_length = 99;
        truncation_symbol = ".../";
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = " ";
        style = "bold green";
        format = "[$symbol$branch ]($style)";
      };

      git_status = {
        format = "[$all_status]()";
        ahead = "[$count](green)";
        behind = "[$count](yellow)";
        staged = "[$count](cyan)";
        conflicted = "[$count](red)";
        modified = "[$count](yellow)";
        deleted = "[$count](red)";
        untracked = "[$count](blue)";
        renamed = "[$count](purple)";
        stashed = "[$count](blue)";
      };

      line_break = { disabled = false; };

      rust = { symbol = ""; };
      nix_shell = { symbol = ""; };

      cmd_duration = { disabled = true; };
    };
  };
}
