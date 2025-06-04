{ pkgs, ... }: {
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      add_newline = true;

      format = ''
         $directory$git_branch$git_status
        $character'';

      character = {
        disabled = false;
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
      };

      directory = {
        style = "blue";
        format = "[$path]($style) ";
        truncation_length = 99;
        truncation_symbol = ".../";
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = " ";
        style = "bold green";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        format = "[$all_status]()";
        ahead = "[ ($count)](green)"; # arrow-up
        behind = "[ ($count)](yellow)"; # arrow-down
        staged = "[ ($count)](cyan)"; # checkmark
        conflicted = "[ ($count)](red)"; # conflict icon
        modified = "[ ($count)](yellow)"; # pencil
        deleted = "[ ($count)](red)"; # trash or x icon
        untracked = "[ ($count)](blue)"; # question mark icon
        renamed = "[➜ ($count)](purple)"; # arrow
        stashed = "[ ($count)](blue)"; # package icon
      };

      line_break = { disabled = false; };
    };

  };
}
