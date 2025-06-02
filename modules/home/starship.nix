{ pkgs, ... }:
{
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      add_newline = true;
      format = " $hostname$shell$directory$git_branch$git_status$character";

      directory = {
        style = "blue";
        format = "[$path ]($style)";
        truncation_length = 99;
        truncation_symbol = "…/";
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = "󰘬";
        format = "[ [$symbol](bold black bg:#cba6f7) $branch ](bg:#cba6f7 black)";
      };

      git_status = {
        disabled = false;
        ignore_submodules = false;
	ahead = "[ ($count) ](blue)";
	behind = "[ ($count) ](yellow)";
	deleted = "[ ($count) ](red)";
	diverged = "[ﰬ ($count) ](red)";
	modified = "[ ($count) ](yellow)";
	renamed = "[ ($count) ](purple)";
	staged = "[ ($count) ](cyan)";
	stashed = "[ ($count) ](blue)";
	format = "[ $all_status$ahead_behind]()";
      };

      character = {
       disabled = false;
       success_symbol = "[❯](green)";
       error_symbol = "[❯](red)";
     };

      shell = {
        zsh_indicator = " zsh";
        nu_indicator = " nu";
        fish_indicator = "";
        unknown_indicator = "";
        style = "yellow";
        disabled = false;
      };

      line_break = {
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "bold cyan";
      };
    };
  };
}
