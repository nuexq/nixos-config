{ pkgs, ... }: {
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      add_newline = true;

      character = { use_symbol_for_status = false; };

      directory = {
        style = "purple";
        format = "[$path]($style)";
        truncation_length = 99;
        truncate_symbol = ".../";
        truncate_to_repo = false;
      };

      git_branch = { symbol = " "; };

      git_commit = {
        disabled = false;
        commit_hash_length = 4;
        tag_disabled = false;
      };

      git_state = { disabled = true; };

      git_status = {
        # disabled = false;
        # ignore_submodules = false;
        # ahead = "[ ($count) ](blue)";
        # behind = "[ ($count) ](yellow)";
        # deleted = "[ ($count) ](red)";
        # diverged = "[ﰬ ($count) ](red)";
        # modified = "[ ($count) ](yellow)";
        # renamed = "[ ($count) ](purple)";
        # staged = "[ ($count) ](cyan)";
        # stashed = "[ ($count) ](blue)";
        # format = "[ $all_status$ahead_behind]()";

        conflicted_count = { enabled = true; };
        untracked_count = { enabled = true; };
        modified_count = { enabled = true; };
        staged_count = { enabled = true; };
        renamed_count = { enabled = true; };
        deleted_count = { enabled = true; };
        stashed_count = { enabled = true; };
      };

      kubernetes = {
        symbol = "⎈ ";
        disabled = true;
      };

      line_break = { disabled = false; };

      nix_shell = { disabled = true; };

      memory_usage = { disabled = true; };

      java = { symbol = " "; };

      julia = { symbol = " "; };

      nodejs = { symbol = ""; };

      package = { symbol = ""; };

      python = { };

      ruby = { };

      rust = { symbol = " "; };

      username = { disabled = false; };

    };
  };
}
