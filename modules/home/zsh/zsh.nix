{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      # autoload -Uz compinit && compinit
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      export STARSHIP_CONFIG=~/.config/starship.toml

      DISABLE_AUTO_UPDATE=true
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"

      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_ignore_dups
      setopt hist_find_no_dups
      setopt hist_expire_dups_first
      setopt hist_verify

      # Make sure that the terminal is in application mode when zle is active, since
      # only then values from $terminfo are valid
      if (( ''${+terminfo[smkx]} )) && (( ''${+terminfo[rmkx]} )); then
        function zle-line-init() {
          echoti smkx
        }
        function zle-line-finish() {
          echoti rmkx
        }
        zle -N zle-line-init
        zle -N zle-line-finish
      fi
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
