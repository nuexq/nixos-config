{ ... }:
let
  ssv = symbol: style: {
    inherit symbol;
    format = "via [$symbol](${style})";
  };
in {
  programs.starship = {
    enable = true;

    enableFishIntegration = true;

    settings = {
      add_newline = true;

      format = ''
        $directory$git_branch$git_status$nix_shell
        $character'';

      character = {
        disabled = false;
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
      };

      directory = {
        style = "blue";
        truncation_length = 3;
        truncation_symbol = "…/";
        read_only_style = "red";
        read_only = "  ";
        format = "[$path]($style)[$read_only]($read_only_style) ";
      };

      git_branch = {
        symbol = " ";
        style = "bold green";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        format = "[$all_status]()";
        ahead = "[ ($count) ](green)";
        behind = "[ ($count) ](yellow)";
        staged = "[ ($count) ](cyan)";
        conflicted = "[ ($count) ](red)";
        modified = "[ ($count) ](yellow)";
        deleted = "[ ($count) ](red)";
        untracked = "[ ($count) ](blue)";
        renamed = "[ ($count) ](purple)";
        stashed = "[ ($count) ](blue)";
      };

      nix_shell = ssv " " "blue";

      line_break = { disabled = false; };
    };

  };
}
