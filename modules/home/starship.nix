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
        style = "purple";
        format = "[$path ]($style)";
        truncation_length = 99;
        truncate_symbol = ".../";
        truncate_to_repo = false;
      };

      git_branch = { symbol = " "; };

      git_status = {
        conflicted_count = { enabled = true; };
        untracked_count = { enabled = true; };
        modified_count = { enabled = true; };
        staged_count = { enabled = true; };
        renamed_count = { enabled = true; };
        deleted_count = { enabled = true; };
        stashed_count = { enabled = true; };
      };

      line_break = { disabled = false; };

      rust = { symbol = ""; };
      nix_shell = { symbol = ""; };

      cmd_duration = { disabled = true; };
    };
  };
}
